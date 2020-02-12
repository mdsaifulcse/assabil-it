<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/','IndexController@login');
Route::get('/', function (){
    return redirect('/login');
});

Route::middleware(['auth','disablepreventback'])->group(function () {
    Route::get('/home', 'DashboadController@home');
    Route::get('/home/{slug}', 'DashboadController@subMenu');
    Route::get('/home/{slug}/{subslug}', 'DashboadController@subSubMenu');

    Route::resource('/products','ProductController')->middleware('permission:products.view,products.create,products.update,products.delete');
    Route::get('/show-all-products','ProductController@getAllProductsData')->middleware('permission:products.view');
    Route::get('/product-details/{productId}','ProductController@show')->middleware('permission:products.view');
    Route::get('/product-edit/{productId}','ProductController@edit')->middleware('permission:products.update');

    Route::resource('/designation','DesignationController');//->middleware('permission:designation');

    // acl -----------------------------
    Route::resource('acl-role', 'AclRolesController');//->middleware('permission:acl-role');
    Route::resource('acl-permission', 'AclPermissionController')->middleware('role:developer');
    Route::post('acl-permission-role', 'AclPermissionController@storeRole')->middleware('permission:acl');

    Route::resource('primary-info','PrimaryInfoController')->middleware('permission:primary-info');

    Route::resource('all-users','UsersController')->middleware('permission:users');
    Route::get('show-user-details/{userId}','UsersController@showUserDetails')->middleware('permission:users');

    Route::resource('user-profile','ProfileController');
    Route::post('change-password',[ 'as'=>'password','uses'=>'UsersController@password']);
    Route::get('change-password','UsersController@changePass')->middleware('permission:users');

    // menu setting --------------------
    Route::resource('menu','MenuController')->middleware('permission:menu');
    Route::resource('sub-menu','SubMenuController')->middleware('permission:menu');
    Route::resource('sub-sub-menu','SubSubMenuController')->middleware('permission:menu');
    Route::get('/logout','IndexController@logout');
});

Auth::routes(['register'=>false]);


