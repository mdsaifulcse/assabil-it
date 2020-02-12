<div class="modal-dialog modal-md">
    <div class="modal-content">
        <div class="modal-header">
            <h4 class="modal-title"> Details of {{$product->product_name}} </h4>
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        </div>
        <div class="modal-body">

            <table class="table table-bordered table-hover table-striped">

                <tbody>
                <tr>
                    <td>Product Name</td>
                    <td>{{$product->product_name}} </td>
                </tr>
                <tr>
                    <td>Photo</td>
                    <td>

                        @if(!empty($product->product_img))
                            <img src="{{asset($product->product_img)}}" width="50">
                        @else
                            <h5>No Image</h5>
                        @endif
                    </td>
                </tr>

                <tr>
                    <td>Status</td>
                    <td>

                        @if($product->status==1)
                           <span class="text-success"> Active <i class="fa fa-check"></i></span>
                        @else
                            <span class="text-danger"><i class="fa fa-warning"></i> Inactive</span>
                        @endif
                    </td>
                </tr>

                <tr>
                    <td>Creation Date</td>
                    <td>{{date('d-M-Y',strtotime($product->created_at))}} </td>
                </tr>

                <tr>
                    <td>Details</td>
                    <td>{{$product->description}} </td>
                </tr>

                </tbody>

            </table>


        </div>
        <div class="modal-footer">
            <a href="javascript:;" class="btn btn-sm btn-danger" data-dismiss="modal">Close</a>

        </div>
    </div>
</div>