<?php

namespace App\Services;

use App\Helpers\HelperFunctions;
use App\Models\Order;
use App\Models\User;
use GuzzleHttp\Client;
use GuzzleHttp\Exception\ClientException;
use GuzzleHttp\Exception\GuzzleException;
use Hash;
use Illuminate\Http\Request;
use JsonException;
use Symfony\Component\HttpFoundation\Response;

class ServiceKeycloak
{
    private Client $client;
    const URL_TOKEN = "http://keycloak:8080/auth/realms/jump_park/protocol/openid-connect";
    const URL = "http://keycloak:8080/auth/admin/realms/jump_park";
    private array $header = [];
    public function __construct()
    {
        $this->client = new Client();
        $this->header = [
            "Authorization" => 'Bearer ' . $this->getTokenService()->access_token,
            "Content-Type" => "application/json"
        ];
    }

    public function getTokenService()
    {
        try {
            $response = $this->client->post(self::URL_TOKEN . '/token', [
                'form_params' => [
                    "client_secret" => "nZZURxM9y7JysjxWDDSjlm6lc2cjDA1a",
                    "client_id" => "manager-cli",
                    "grant_type" => "client_credentials"
                ]
            ]);
            return json_decode($response->getBody()->getContents());
        } catch (ClientException $exception) {
            return $exception->getMessage();
        }
    }
    public function getTokenUser($username, $password)
    {
        try {
            $response = $this->client->post(self::URL_TOKEN . '/token', [
                'form_params' => [
                    'username' => $username,
                    'password' => $password,
                    "client_id" => "admin-cli",
                    "grant_type" => "password"
                ]
            ]);
            return json_decode($response->getBody()->getContents(), false, 512, JSON_THROW_ON_ERROR);
        } catch (ClientException $exception) {
            return $exception->getMessage();
        }
    }

    /**
     * @throws GuzzleException
     * @throws JsonException
     */
    public function createUser($user, $group)
    {
        $json = json_encode([
            "enabled" => true,
            "username" => $user['email'],
            "email" => $user['email'],
            "firstName" => $user['name'],
            "credentials" => [
                [
                    "type" => "password",
                    "value" => $user['password'],
                    "temporary" => false
                ]
            ],
            "emailVerified" => true,
            "groups" => [
                $group
            ],
            "realmRoles" => ["mb-user"]
        ], JSON_THROW_ON_ERROR);
        try {
            return $this->client->post(self::URL . '/users', [
                'headers' => $this->header,
                'body' => $json
            ]);
        } catch (ClientException $exception) {
            return $exception->getCode();
        }
    }
}
