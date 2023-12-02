<?php

namespace App\Services;

use App\Helpers\HelperFunctions;
use App\Models\Order;
use App\Models\User;
use Exception;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class ServiceOrder
{
    public function __construct() {}

    public function list(Request $request): ?object
    {
        $plate = $request->query('plate');
        $order = Order::select(
            [
                'id',
                'user_id',
                'vehiclePlate',
                'entryDateTime',
                'exitDateTime',
                'priceType',
                'price'
            ]
        )
            ->with('user', function ($join)  {
                $join->select('id','name');
        });

        if ($request->query('date') !== null)  {
            match ($request->query('date')) {
                'asc'  =>  $order->orderBy('created_at',  'ASC'),
                'desc'  =>  $order->orderBy('created_at',   'DESC')
            };
        }
        return $order->where('vehiclePlate', '=', $plate)->paginate(5)
            ->where('user_id', '=', \Auth::id());
    }

    public function create(Request $request): array
    {
        $id = \Auth::id();
        $user = User::where('id', '=',  $id)->first();
        $data = [
            'vehiclePlate' => $request->input('vehiclePlate'),
            'entryDateTime' => HelperFunctions::formatDateMySQL($request->input('entryDateTime')),
            'exitDateTime' => HelperFunctions::formatDateMySQL($request->input('exitDateTime')),
            'priceType' => $request->input('priceType'),
            'price' => $request->input('price'),
        ];
        $result = $user->service_orders()->create($data);
        return ['data' => $result, 'status' => Response::HTTP_CREATED];
    }
    public function view($id): ?object
    {
        return Order::select(
            [
                'id',
                'user_id',
                'vehiclePlate',
                'entryDateTime',
                'exitDateTime',
                'priceType',
                'price'
            ]
        )
            ->with('user', function ($join)  {
                $join->select('id','name');
            })
            ->where('id', $id)
            ->where('user_id','=', \Auth::id())
            ->first();
    }

    /**
     * @throws Exception
     */
    public function update(Request $request): ?bool
    {
        $id = (int)$request->input('id');
        $order = Order::where('user_id', \Auth::id())
            ->where('id', $id)
            ->first();
        $data  =  [
            'vehiclePlate' =>  $request->input('vehiclePlate'),
            'price'  =>  $request->input('price')
        ];
        if (!$order)  {
            throw new Exception('Unauthorized user or service order does not exist');
        }
        return $order?->update($data);
    }

    /**
     * @throws Exception
     */
    public function delete($id): ?bool
    {
        $order = Order::where('id', $id)
            ->where('user_id', \Auth::id())->first();
        if ($order === null)  {
            throw new Exception('Unauthorized user');
        }
        return $order->delete();
    }
}
