<?php

use Illuminate\Database\Seeder;
use App\User;

class UserTableSeeder extends Seeder
{
    public function run()
    {
        $user = new User;
        $user->name = "Admin";
        $user->email = "admin@poturovic.com";
        $user->password = bcrypt('secret');
        $user->is_admin = true;
        $user->save();
    }
}