<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\CreateUserRequest;
use App\Services\ServiceUser;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class UserController extends Controller
{
    protected ServiceUser $serviceUser;
    public function __construct(ServiceUser  $serviceUser)
    {
        $this->serviceUser = $serviceUser;
    }

    public function create(CreateUserRequest $request)
    {
        try {
            $result = $this->serviceUser->create($request);
        } catch (\Exception $exception) {
            $result = [
                'status' => Response::HTTP_INTERNAL_SERVER_ERROR,
                'error' => $exception->getMessage()
            ];
        }
        return response()->json($result, $result['status'], [], JSON_UNESCAPED_SLASHES);
    }
}
