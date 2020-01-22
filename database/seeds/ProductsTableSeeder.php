<?php

use Illuminate\Database\Seeder;
use App\Product;

class ProductTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
    	$products = [
    		[
    			'name' => "Death Star",
    			'description' => "One and only deathstar",
    			'units' => 1,
    			'price' => 200,
    			'image' => "https://cdn.shopify.com/s/files/1/0030/4227/9494/products/sw-death-star-neon-light-01_800x.progressive.jpg?v=1574306724"
    		],
    			
			[
    			'name' => "Wonder women tofflor",
    			'description' => "Kän dig varm i dessa tofflor",
    			'units' => 15,
    			'price' => 300,
				'image' => "https://cdn.shopify.com/s/files/1/1375/9903/products/wonder-woman-retro-dc-comics-slippers-white-bg-01_800x.progressive.jpg?v=1577566856"
			],
    	];

    	foreach ($products as $product) {
    		Product::create($product);
    	}

    }
}