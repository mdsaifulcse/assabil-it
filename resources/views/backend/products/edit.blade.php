<div class="modal-dialog modal-md">
    <div class="modal-content">
        {!! Form::open(array('route' =>[ 'products.update',$product->id],'class'=>'form-horizontal','method'=>'PUT','files'=>true)) !!}
        <div class="modal-header">
            <h4 class="modal-title"> <i class="fa fa-pencil"></i> Edit Product </h4>
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        </div>
        <div class="modal-body">
            <div class="form-group row">
                <label class="control-label col-md-3 col-sm-3"> Product Name <sup class="text-danger">*</sup> :</label>
                <div class="col-md-8 col-sm-8">
                    {{Form::text('product_name',$value=$product->product_name,['class'=>'form-control','placeholder'=>'Enter Product Name','required'=>true])}}
                </div>
                <span class="text-danger">{{$errors->has('product_name')?$errors->first('product_name'):''}}</span>
            </div>

            <div class="form-group row">
                <label class="control-label col-md-3 col-sm-3"> Description <sup class="text-danger">*</sup> :</label>
                <div class="col-md-8 col-sm-8">
                    {{Form::textArea('description',$value=$product->description,['class'=>'form-control','placeholder'=>'Enter description','rows'=>5,'required'=>true])}}
                </div>
                <span class="text-danger">{{$errors->has('description')?$errors->first('description'):''}}</span>
            </div>

            <div class="form-group row">
                <label class="control-label col-md-3 col-sm-3"> Product Image <sup class="text-danger">*</sup> :</label>
                <div class="col-md-4 col-sm-8">

                    <label class="slide_upload profile-image" for="file">
                        <!--  -->
                        @if(!empty($product->product_img))
                        <img id="image_load" src="{{asset($product->product_img)}}">

                            @else
                            <img id="image_load" src="{{asset('images/default/photo.png')}}">
                            @endif
                    </label>

                    <input id="file" style="display:none" name="product_img" type="file" onchange="photoLoad(this,this.id)">

                    @if ($errors->has('product_img'))
                        <span class="invalid-feedback" role="alert">
                            <strong class="text-danger">{{ $errors->first('product_img') }}</strong>
                        </span>
                    @endif

                </div>
                <span class="text-danger">{{$errors->has('product_name')?$errors->first('product_name'):''}}</span>

                <div class="col-md-4 col-sm-8">
                    {{Form::select('status',['1'=>'Active','0'=>'Inactive'],$product->status,['class'=>'form-control','placeholder'=>'Select Status','required'=>true])}}
                </div>

            </div>


        </div>
        <div class="modal-footer">
            <a href="javascript:void(0)" class="btn btn-sm btn-danger pull-left" data-dismiss="modal">Close</a>
            <button type="submit" class="btn btn-sm btn-success">Update</button>
        </div>
        {!! Form::close(); !!}
    </div>
</div>