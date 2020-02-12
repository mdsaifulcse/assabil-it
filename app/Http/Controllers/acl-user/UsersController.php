<?php

namespace App\Http\Controllers;
use App\Models\Designation;
use App\Models\UserInfo;
use Carbon\Carbon;
use FontLib\Table\Type\hhea;
use Illuminate\Http\Request;
use App\User;
use Image,Auth,DB,MyHelper,Validator;
use Yajra\Acl\Models\Role;

class UsersController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
    $authRole=\MyHelper::userRole(Auth::user()->id)->role;

      $allUsers=User::with('userInfo')->leftJoin('user_infos','user_infos.user_id','users.id')
            ->leftJoin('role_user','users.id','role_user.user_id')
            ->leftJoin('roles','role_user.role_id','roles.id')
            ->where('users.id','!=',1)
            ->select('user_infos.*','users.*','roles.name as role_name','role_id')
            ->orderBy('users.id','desc');

        if ($authRole=='distributor'){
          $allUsers=$allUsers->where('roles.slug','business-manager');
        }

        if ($authRole=='business-manager'){
            $allUsers=$allUsers->where('roles.slug','general-user');
        }

        $allUsers=$allUsers->paginate(20);

        return view('backend.primary_info.user.index',compact('allUsers','authRole'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $designations=Designation::orderBy('id','desc')->where('status',1)->pluck('designation','id');

        $roles=Role::where('system',1)->where('slug','!=','developer');
        $authRole=\MyHelper::userRole(Auth::user()->id)->role;
        if ($authRole=='distributor'){
            $roles=$roles->where('slug','business-manager');
        }
        if ($authRole=='business-manager'){
            $roles=$roles->where('slug','general-user');
        }
        $roles=$roles->pluck('name','id');

       return view('backend.primary_info.user.create',compact('roles','designations','authRole'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        $validateFields=[
        'name' => 'required|max:50',
        'mobile'  => "required|min:11|max:11|unique:users|regex:/(01)[0-9]{9}/",
        'email'  => "unique:users",
        'designation_id' => 'required|exists:designations,id',
        'role_id' => 'required|exists:roles,id',
        'password' => 'required|min:8|confirmed',
        /*enable   extension=php_fileinfo*/
        ];

        if ($request->email==null){
            unset($validateFields['email']);
        }

        $validator = Validator::make($request->all(), $validateFields);
                if ($validator->fails()) {
                    return redirect('/all-users/create')->withErrors($validator)->withInput();
                }

            $input = $request->all();
            $input['password']=bcrypt($input['password']);
            $input['created_by']=Auth::user()->id;

            $roleData=Role::where('id',$request->role_id)->first();



            if ($roleData->slug=='super-admin'){
                $input['type']=1;
            }elseif ($roleData->slug=='distributor'){
                $input['type']=2;
            }elseif ($roleData->slug=='business-manager'){
                $input['type']=3;
            }elseif ($roleData->slug=='general-user'){
                $input['type']=4;
            }



        if ($request->hasFile('image')){
                $input['image']=MyHelper::photoUpload($request->file('image'),'images/users/',120,100);
            }

        DB::beginTransaction();
        try{

            $insertId= User::create($input)->id;
            $oldRole=DB::table('role_user')->where('user_id',$insertId)->first();
            if($oldRole!=null){
                DB::table('role_user')->where('user_id',$insertId)->update(['role_id'=>$request->role_id]);
            }else{
                DB::table('role_user')->insert(['role_id'=>$request->role_id,'user_id'=>$insertId]);
            }

            $input['user_id']=$insertId;
            UserInfo::create($input);


            DB::commit();
            $bug=0;
            }catch(\Exception $e){
                DB::rollback();
                $bug=$e->errorInfo[1];
                $bug2=$e->errorInfo[2];
            }
             if($bug==0){
            return redirect('all-users')->with('success','Data Successfully Inserted');
            }elseif($bug==1062){
                return redirect()->back()->with('error','The Email has already been taken.');
            }else{
                return redirect()->back()->with('error','Something Error Found ! '.$bug2);
            }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $data=User::leftJoin('role_user','users.id','role_user.user_id')->select('users.*','role_id')->where('users.id',$id)->first();
        if($data==null){
            return redirect()->back();
        }
        //$roles=DB::table('roles')->where('system',1)->pluck('name','id');

        return view('backend.primary_info.user.password',compact('data'));
    }

    protected function showUserDetails($userId){

        User::findOrFail($userId);
        $data=User::leftJoin('user_infos','user_infos.user_id','users.id')
            ->leftJoin('role_user','role_user.user_id','users.id')
            ->leftJoin('roles','role_user.role_id','roles.id')
            ->leftJoin('designations','user_infos.designation_id','designations.id')
            ->select('roles.name as roleName','role_user.role_id','designations.designation','user_infos.*','users.*')->where('users.id',$userId)->first();
        return view('backend.primary_info.user.user-details',compact('data'));

    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     *
     */
    public function edit($id)
    {
        User::findOrFail($id);
        $data=User::leftJoin('user_infos','user_infos.user_id','users.id')
        ->leftJoin('role_user','role_user.user_id','users.id')
        ->select('role_user.role_id','user_infos.*','users.*')->where('users.id',$id)->first();

        $designations=Designation::orderBy('id','desc')->where('status',1)->pluck('designation','id');

        $roles=Role::where('system',1)->where('slug','!=','developer');
        $authRole=\MyHelper::userRole(Auth::user()->id)->role;
        if ($authRole=='distributor'){
            $roles=$roles->where('slug','business-manager');
        }
        if ($authRole=='business-manager'){
            $roles=$roles->where('slug','general-user');
        }
        $roles=$roles->pluck('name','id');

        return view('backend.primary_info.user.edit',compact('data','roles','designations','authRole'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {

        $validateFields=[
            'name' => 'required|max:50',
            'mobile'  => "required|min:11|max:11|unique:users,mobile,$id|regex:/(01)[0-9]{9}/",
            'email'  => "unique:users,email,$id",
            'role_id' => 'required|exists:roles,id',
            /*enable   extension=php_fileinfo*/
        ];

        if ($request->email==null){
            unset($validateFields['email']);
        }

        $validator = Validator::make($request->all(), $validateFields);
        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        $data= User::findOrFail($id);

        $input = $request->except('_token');

        DB::beginTransaction();

        try{
        if(isset($request->role_id)){
            $oldRole=DB::table('role_user')->where('user_id',$id)->first();
            if($oldRole!=null){
                DB::table('role_user')->where('user_id',$id)->update(['role_id'=>$request->role_id]);
            }else{
                DB::table('role_user')->insert(['role_id'=>$request->role_id,'user_id'=>$id]);
            }
        }

        if ($request->hasFile('image')){
            $input['image']=MyHelper::photoUpload($request->file('image'),'images/users/',120,100);

            if (file_exists($data->image)){
                unlink($data->image);
            }
        }

        $input['updated_by']=Auth::user()->id;

        $userInfo=UserInfo::where('user_id',$id)->first();
            $userInfo->update($input);

        $data->update($input);
        DB::commit();
        $bug=0;
        }catch(Exception $e)
        {
            DB::rollback();
           $bug=$e->errorInfo[1];
            $bug1=$e->errorInfo[2];
        }

        if($bug==0){

        return redirect()->back()->with('success','Successfully updated');

        }elseif ($bug==1062) {

            return redirect()->back()->with('error','Data has already been taken');
        }else{
            return redirect()->back()->with('error','Something error taken !');
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $userData=User::findOrFail($id);

        DB::beginTransaction();
        try {
            $userInfo=UserInfo::where('user_id',$userData->id)->delete();
            $userData->delete();

            if (file_exists($userData->image)){
                unlink($userData->image);
            }


            $bug = 0;
            DB::commit();

        } catch (\Exception $e) {
            DB::rollback();
            $bug = $e->errorInfo[1];
            $bug1 = $e->errorInfo[2];
        }

        if ($bug == 0) {
            return redirect()->back()->with('success', ' Users Deleted Successfully.');
        }elseif ($bug==1451){
            return redirect()->back()->with('error', 'Sorry this users can not be delete due to used another module');
        }
        else {
            return redirect()->back()->with('error', 'Something Error Found! ' . $bug1);
        }
    }


    public function password(Request $request){
        $input=$request->all();
        $newPass=$input['password'];
        $data=User::findOrFail($request->id);
        $validator = Validator::make($request->all(),[
            'password' => 'required|min:6|confirmed',
        ]);
        if ($validator->fails()) {
            return redirect()->back()
                ->withErrors($validator)
                ->withInput();
        }
        $input['password']=bcrypt($newPass);
        try{
            $data->update($input);
            $bug=0;
        }catch(\Exception $e){
            $bug=$e->errorInfo[1];
        }
        if($bug==0){
            return redirect()->back()->with('success','Password Changed Successfully !');
        }else{
            return redirect()->back()->with('error','Something is wrong !');

        }
    }


    public function profile(){
        $id=Auth::user()->id;
        $data=User::findOrFail($id);
        $type=DB::table('user_type')->where('type',Auth::user()->type)->pluck('type_name','type');
        return view('profile.show',compact('data','type'));
    }

    public function changePass()
    {
        $id=Auth::user()->id;
        $data=User::findOrFail($id);
        return view('profile.password',compact('data'));
    }




}
