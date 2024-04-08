<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\profileController;
use App\Http\Controllers\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/


// user
Route::post('register', [AuthController::class, 'Register']);
Route::post('login', [AuthController::class, 'Login']);
Route::middleware('auth:sanctum')->group(function(){
    Route::post('logout', [AuthController::class, 'Logout']);
    Route::get('user', [AuthController::class, 'User']);
});
Route::get('sendMail/:email', [AuthController::class, 'sendEmail']);
Route::post('updateUser/{id}', [UserController::class, 'updateUser']);

// profile
Route::get('profiles', [profileController::class, 'allProfiles']);

