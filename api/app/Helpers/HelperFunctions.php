<?php
/*
 * *
 *  @author Dayvison Silva - Diretor de Desenvolvimento - <dayvisonsilva@gmail.com>
 *  @author Gustavo V. Goulart - Desenvolvedor Sênior - <gustavo@inovacto.com.br>
 *
 *  @copyright © 2022 Bell Tecnologia. Todos os direitos reservados.
 * /
 */

namespace App\Helpers;

use Carbon\Carbon;

class HelperFunctions
{
    public static function formatDateMySQL($value, $format = 'Y-m-d H:i'): string
    {
        return Carbon::createFromFormat('d/m/Y H:i', $value)->format($format);
    }
    public static function coin($amount): string
    {
        return number_format($amount, 2, '.', ',');
    }
}
