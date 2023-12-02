<?php

use App\Http\Controllers\Api\Auth\LoginController;
use App\Http\Controllers\Api\OrderController;
use App\Http\Controllers\Api\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
Route::group(['prefix' => 'v1', 'namespace' => 'Api'], static function () {
    Route::prefix('auth')->namespace('Auth')->group(function () {
        Route::post('/login', [LoginController::class, 'login']);
    });
});
Route::group(['prefix' => 'v1', 'namespace' => 'Api'], static function () {
    Route::prefix('users')->group(function () {
        Route::post('/create', [UserController::class, 'create']);
    });
});

Route::middleware(['auth:api', 'throttle'])->group(function () {
    Route::group(['prefix' => 'v1', 'namespace' => 'Api'], static function () {
        Route::prefix('order')->group(function () {
            Route::get('/list', [OrderController::class, 'list']);
            Route::get('/view/{id}', [OrderController::class, 'view']);
            Route::post('/create', [OrderController::class, 'create']);
            Route::patch('/update', [OrderController::class, 'update']);
            Route::delete('/delete/{id}', [OrderController::class, 'delete']);
        });
    });
});
