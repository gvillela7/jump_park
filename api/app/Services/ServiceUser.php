<?php

namespace App\Services;


use App\Models\User;
use Exception;
use GuzzleHttp\Exception\GuzzleException;
use Hash;
use Illuminate\Http\Request;
use JsonException;
use Symfony\Component\HttpFoundation\Response;

class ServiceUser
{
    private ServiceKeycloak $serviceKeycloak;
    public function __construct(ServiceKeycloak $serviceKeycloak)
    {
        $this->serviceKeycloak = $serviceKeycloak;
    }

    public function checkUser($email): ?User
    {
        return User::where('email', $email)->first();
    }

    /**
     * @throws JsonException
     * @throws Exception
     */
    public function getToken($username, $password)
    {
        $result = $this->serviceKeycloak->getTokenUser($username, $password);
        if (property_exists($result, 'access_token')){
            return $result;
        }
        throw new Exception('Invalid username or password!!!');
    }

    /**
     * @throws GuzzleException
     * @throws JsonException
     */
    public function create(Request $request): array
    {
        $data  =  [
            'name'  =>  $request->input('name'),
            'email'  => $request->input('email'),
            'username' => $request->input('email'),
            'password' =>  $request->input('password'),
        ];
        $result = $this->serviceKeycloak->createUser($data, 'user');
        if ($result === 409) {
            return ['data' => 'E-mail already registered!!!', 'status' => Response::HTTP_CONFLICT];
        }
        $data['password'] = Hash::make($request->input('password'));
        $user = User::create($data);
        return ['data'=> $user, 'status' => Response::HTTP_CREATED];
    }
}
