<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;
use Image,Auth,DB,MyHelper,Validator;
use Yajra\DataTables\DataTables;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        return view('backend.products.index');
    }

    protected function getAllProductsData(){



        $dailyVisitData=Product::orderBy('id','DESC');

        return DataTables::of($dailyVisitData)
            ->addIndexColumn()
            ->addColumn('DT_RowIndex','')
            ->addColumn('Image',
                '@if($product_img==\'\')
                <span class="text-danger"> No Photo </span>
            @else
           <img src="{{asset($product_img)}}" alt="{{$product_name}}" title="{{$product_name}}" width="50">
            @endif')
            ->addColumn('Date','<?php echo date(\'d-M-Y\',strtotime($created_at))?>')
            ->addColumn('Status',
                '@if($status==1)
                <span class="btn btn-default btn-xs"> Active </span>
                @elseif($status==0)
                <span class="btn btn-warning btn-xs"> Inactive </span>
                @endif
                ')

            ->addColumn('Action','
                <div class="dropdown ">
                  <button class="no-padding" id="dLabel" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Action
                    <span class="caret"></span>
                  </button>
                  <ul class="dropdown-menu action-dropdown " aria-labelledby="dLabel">
                  @can(\'products.view\')
                    <li><a href="javascript:void(0);" onclick="showProductDetails({{$id}})" title="Click here to view Details" class="btn btn-primary btn-xs" >Detail</a></li>
                    @endcan
                  @can(\'products.update\')
                    <li><a href="javascript:void(0);" onclick="editProduct({{$id}})" title="Click here to update product information" class="btn btn-warning btn-xs" ><i class="fa fa-pencil no-margin"></i> Edit</a>
                    </li>
                    @endcan
                    
                    @can(\'products.delete\')
                    <li>
        
                    {!! Form::open(array(\'route\'=> [\'products.destroy\',$id],\'method\'=>\'DELETE\',\'class\'=>\'deleteForm\',\'id\'=>"deleteForm$id")) !!}
                        {{ Form::hidden(\'id\',$id)}}
                        <button type="button" onclick=\'return deleteConfirm("deleteForm{{$id}}");\' class="deleteBtn btn btn-danger btn-xs">
                          <i class="fa fa-trash-o" aria-hidden="true"></i> Delete
                        </button>
                    {!! Form::close() !!}
                   
                    </li>
                    @endcan
                  
                  </ul>
                </div>
            ')->rawColumns(['Image','Date','Status','Action'])->toJson();


    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //return $request;
        $validateFields=[
            'product_name' => 'required|max:100',
            'description' => 'required|max:200',
            'product_img' => 'nullable|mimes:jpeg,jpg,bmp,png',
            /*enable   extension=php_fileinfo*/
        ];


        $validator = Validator::make($request->all(), $validateFields);
        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        $input = $request->all();
        $input['created_by']=Auth::user()->id;

        if ($request->hasFile('product_img')){
            $input['product_img']=MyHelper::photoUpload($request->file('product_img'),'images/product-img/',200);
        }

        DB::beginTransaction($input);
        try{
            Product::create($input);


            DB::commit();
            $bug=0;
        }catch(\Exception $e){
            DB::rollback();
            $bug=$e->errorInfo[1];
            $bug2=$e->errorInfo[2];
        }
        if($bug==0){
            return redirect()->back()->with('success','New Product Successfully Inserted');
        }elseif($bug==1062){
            return redirect()->back()->with('error','The Email has already been taken.');
        }else{
            return redirect()->back()->with('error','Something Error Found ! '.$bug2);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function show($productId)
    {
        $product=Product::findOrFail($productId);
        return view('backend.products.show',compact('product'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function edit($productId)
    {

         $product=Product::findOrFail($productId);

        return view('backend.products.edit',compact('product'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Product $product)
    {
        $validateFields=[
            'product_name' => 'required|max:100',
            'description' => 'required|max:200',
            'product_img' => 'nullable|mimes:jpeg,jpg,bmp,png',
            /*enable   extension=php_fileinfo*/
        ];


        $validator = Validator::make($request->all(), $validateFields);
        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        $input = $request->all();
        $input['updated_by']=Auth::user()->id;

        if ($request->hasFile('product_img')){
            $input['product_img']=MyHelper::photoUpload($request->file('product_img'),'images/product-img/',200);
            if (file_exists($product->product_img)){
                unlink($product->product_img);
            }

        }

        DB::beginTransaction($input);
        try{
            $product->update($input);


            DB::commit();
            $bug=0;
        }catch(\Exception $e){
            DB::rollback();
            $bug=$e->errorInfo[1];
            $bug2=$e->errorInfo[2];
        }
        if($bug==0) {
            return redirect()->back()->with('success', 'Product Successfully Update');
        }else{
            return redirect()->back()->with('error','Something Error Found ! '.$bug2);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $product=Product::findOrFail($id);

        DB::beginTransaction();
        try {
            $product->delete();

            if (file_exists($product->product_img)){
                unlink($product->product_img);
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
}
