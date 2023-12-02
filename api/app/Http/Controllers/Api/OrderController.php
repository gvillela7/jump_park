<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\CreateOrderRequest;
use App\Http\Requests\QueryConsultOrderRequest;
use App\Http\Requests\UpdateOrderRequest;
use App\Services\ServiceOrder;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class OrderController extends Controller
{
    protected ServiceOrder $serviceOrder;
    public function __construct(ServiceOrder  $serviceOrder)
    {
        $this->serviceOrder = $serviceOrder;
    }

    public function list(QueryConsultOrderRequest $request): JsonResponse
    {
        try {
           $result = [
               'data' => $this->serviceOrder->list($request),
               'status' =>  Response::HTTP_OK
           ];
        } catch (\Exception $exception) {
            $result = [
                'status' => Response::HTTP_INTERNAL_SERVER_ERROR,
                'error' => $exception->getMessage()
            ];
        }
        return response()->json($result['data'], $result['status'], [], JSON_UNESCAPED_SLASHES);
    }

    public function create(CreateOrderRequest $request): JsonResponse
    {
        try {
            $result = $this->serviceOrder->create($request);
        } catch (\Exception $exception) {
            $result = [
                'status' => Response::HTTP_INTERNAL_SERVER_ERROR,
                'error' => $exception->getMessage()
            ];
        }
        return response()->json($result, $result['status'], [], JSON_UNESCAPED_SLASHES);
    }

    public function view($id): JsonResponse
    {
        $result = ['status' =>  Response::HTTP_OK];
        try {
            $result['data'] = $this->serviceOrder->view($id);
        } catch (\Exception $exception) {
            $result = [
                'status' => Response::HTTP_INTERNAL_SERVER_ERROR,
                'error' => $exception->getMessage()
            ];
        }
        return response()->json($result, $result['status']);
    }
    public function update(UpdateOrderRequest $request): JsonResponse
    {
        $result = ['status' =>  Response::HTTP_NO_CONTENT];
        try {
            $result['data'] = $this->serviceOrder->update($request);
        } catch (\Exception $exception) {
            $result = [
                'status' => Response::HTTP_INTERNAL_SERVER_ERROR,
                'error' => $exception->getMessage()
            ];
        }
        return response()->json($result, $result['status']);
    }

    public function delete($id): JsonResponse
    {
        $result = ['status' =>  Response::HTTP_NO_CONTENT];
        try {
            $result['data'] = $this->serviceOrder->delete($id);
        } catch (\Exception $exception) {
            $result = [
                'status' => Response::HTTP_INTERNAL_SERVER_ERROR,
                'error' => $exception->getMessage()
            ];
        }
        return response()->json($result, $result['status']);
    }
}
