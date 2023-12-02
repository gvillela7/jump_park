<?php

namespace App\Http\Controllers\Api\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\LoginRequest;
use App\Services\ServiceUser;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class LoginController extends Controller
{
    protected ServiceUser $serviceUser;
    public function __construct(ServiceUser  $serviceUser)
    {
        $this->serviceUser = $serviceUser;
    }

    public function login(LoginRequest $request)
    {
        $user = $this->serviceUser->checkUser($request->input('username'));
        if ($user === null) {
            return response()->json(['error' => 'incorrect information'], Response::HTTP_FORBIDDEN);
        }
        try {
            $result = ['status' => Response::HTTP_OK];
            $getToken = $this->serviceUser->getToken(
                $request->input('username'),
                $request->input('password')
            );
            $result['data'] = [
                'access_token' => $getToken->access_token,
                'refresh_token' => $getToken->refresh_token,
                'expires_in' => $getToken->refresh_expires_in,
                'name' => $seller->name ?? $user->name,
                'username' => $seller->username ?? $user->username,
            ];
        } catch (\Exception $exception) {
            $result = [
                'status' => Response::HTTP_INTERNAL_SERVER_ERROR,
                'error' => $exception->getMessage()
            ];
        }

        return response()->json($result, $result['status']);
    }
}
