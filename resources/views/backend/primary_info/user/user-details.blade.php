<div class="modal-dialog modal-md">
    <div class="modal-content">
        <div class="modal-header">
            <h4 class="modal-title"> User Details of {{$data->name}} </h4>
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        </div>
        <div class="modal-body">

            <table class="table table-bordered table-hover table-striped">

                <tbody>
                <tr>
                    <td>Name</td>
                    <td>{{$data->name}} </td>
                </tr>
                <tr>
                    <td>Mobile</td>
                    <td>{{$data->mobile}} </td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td>{{$data->email==''?$data->email:'No Email'}} </td>
                </tr>
                <tr>
                    <td>Designation</td>
                    <td>{{$data->designation}} </td>
                </tr>

                <tr>
                    <td>Role</td>
                    <td>{{$data->roleName}} </td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td>{{$data->address}} </td>
                </tr>
                <tr>
                    <td>Photo</td>
                    <td>

                        @if(!empty($data->image))
                            <img src="{{asset($data->image)}}" width="50">
                        @else
                            <h5>No Image</h5>
                        @endif

                    </td>
                </tr>

                </tbody>

            </table>


        </div>
        <div class="modal-footer">
            <a href="javascript:;" class="btn btn-sm btn-danger" data-dismiss="modal">Close</a>
            <button type="submit" class="btn btn-sm btn-success">Confirm</button>
        </div>
    </div>
</div>