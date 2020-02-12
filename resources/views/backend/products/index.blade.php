@extends('backend.app')
@section('breadcrumb')
    <ol class="breadcrumb">
        <li><a href="{{URL::to('home')}}"><i class="fa fa-home"></i> Home</a></li>
        <li class="active">Products</li>
    </ol>
@endsection

@section('content')

    <style>
        .action-dropdown>li>a{
            display: inline-block !important;
            padding: 3px 11px;
            margin-bottom: 2px;
        }
    </style>

    <!-- begin #content -->
    <div id="content" class="content">
    <div class="box box-danger">
        <div class="box-header ui-sortable-handle with-border bg-gray-active">
            <i class="ion ion-clipboard"></i>

            <h3 class="box-title">Product List</h3>

            <div class="box-tools pull-right">
               <a  href="#modal-dialog" class="btn btn-primary btn-sm pull-right" data-toggle="modal" title="Add New Designation " > <i class="fa fa-plus"></i> Add New</a>

            </div>
        </div>
        <!-- /.box-header -->
        <div class="row">
            <div class="col-md-12 ">
                <div class="box-body">
                    <!-- #modal-dialog -->
                    <div class="modal fade" id="modal-dialog">
                        <div class="modal-dialog modal-md">
                            <div class="modal-content">
                                {!! Form::open(array('route' => 'products.store','class'=>'form-horizontal','method'=>'POST','files'=>true)) !!}
                                <div class="modal-header">
                                    <h4 class="modal-title">Add New Product</h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                </div>
                                <div class="modal-body">
                                    <div class="form-group row">
                                        <label class="control-label col-md-3 col-sm-3"> Product Name <sup class="text-danger">*</sup> :</label>
                                        <div class="col-md-8 col-sm-8">
                                            {{Form::text('product_name',$value=old('product_name'),['class'=>'form-control','placeholder'=>'Enter Product Name','required'=>true])}}
                                        </div>
                                        <span class="text-danger">{{$errors->has('product_name')?$errors->first('product_name'):''}}</span>
                                    </div>

                                    <div class="form-group row">
                                        <label class="control-label col-md-3 col-sm-3"> Description <sup class="text-danger">*</sup> :</label>
                                        <div class="col-md-8 col-sm-8">
                                            {{Form::textArea('description',$value=old('description'),['class'=>'form-control','placeholder'=>'Enter description','rows'=>5,'required'=>true])}}
                                        </div>
                                        <span class="text-danger">{{$errors->has('description')?$errors->first('description'):''}}</span>
                                    </div>

                                    <div class="form-group row">
                                        <label class="control-label col-md-3 col-sm-3"> Product Image <sup class="text-danger">*</sup> :</label>
                                        <div class="col-md-8 col-sm-8">

                                            <label class="slide_upload profile-image" for="file">
                                                <!--  -->
                                                <img id="image_load" src="{{asset('images/default/photo.png')}}">
                                            </label>

                                            <input id="file" style="display:none" name="product_img" type="file" onchange="photoLoad(this,this.id)">

                                            @if ($errors->has('product_img'))
                                                <span class="invalid-feedback" role="alert">
                                        <strong class="text-danger">{{ $errors->first('product_img') }}</strong>
                                    </span>
                                            @endif

                                        </div>
                                        <span class="text-danger">{{$errors->has('product_name')?$errors->first('product_name'):''}}</span>
                                    </div>


                                </div>
                                <div class="modal-footer">
                                    <a href="javascript:void(0)" class="btn btn-sm btn-danger pull-left" data-dismiss="modal">Close</a>
                                    <button type="submit" class="btn btn-sm btn-success">Save</button>
                                </div>
                                {!! Form::close(); !!}
                            </div>
                        </div>
                    </div> <!--  =================== End modal ===================  -->

                    <!--  -->
                    <div class="view_branch_set  table-responsive">


                            <table id="productData" class="table table-striped table-bordered nowrap" width="100%">
                                <thead>
                                <tr>
                                    <th>Sl</th>
                                    <th>Name</th>
                                    <th>Image</th>
                                    <th>Status</th>
                                    <th>Creation Date</th>
                                    <th width="16%;">Action</th>
                                </tr>
                                </thead>
                            </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
    <!-- end #content -->

    <div class="modal fade" id="productDetail"></div>
    <div class="modal fade" id="productEditModal"></div>

@endsection
@section('script')

    <script>
        $(function() {
            $('#productData').DataTable( {
                processing: true,
                serverSide: true,
                ordering: true,
                ajax: "{{url('/show-all-products')}}",
                columns: [
                    {data: 'DT_RowIndex', name: 'DT_RowIndex'},
                    { data: 'product_name',name:'products.product_name'},
                    { data: 'Image'},
                    { data: 'Status'},
                    { data: 'Date'},
                    { data: 'Action'},
                ]
            });
        });
    </script>

    <script>
        function showProductDetails(productId) {
            $('#productDetail').load('{{URL::to("/product-details")}}'+'/'+productId)
            $('#productDetail').modal('show')
        }


        function editProduct(productId) {
            $('#productEditModal').load('{{URL::to("/product-edit")}}'+'/'+productId)
            $('#productEditModal').modal('show')
        }

    </script>



    <script>
        function loadImg(input,image_load) {
            console.log(image_load)
            var target_image='#'+$('#'+image_load).prev().children().attr('id');

            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $(target_image).attr('src', e.target.result);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
    @endsection
