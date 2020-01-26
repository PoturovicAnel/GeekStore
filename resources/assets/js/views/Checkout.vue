<template>
    <div class="container">
        <div class="row">
            <div class="col-md-8 offset-md-2">
                <div class="order-box">
                    <img class="checkout-image" :src="product.image" :alt="product.name">
                    <h2 class="title" v-html="product.name"></h2>
                    <p class="small-text text-muted float-left"> {{product.price}} KR </p>
                    <p class="small-text text-muted float-right">Available Units: {{product.units}}</p>
                    <br>
                    <hr>
                    <label class="row"><span class="col-md-2 float-left">Quantity: </span><input type="number" name="units" min="1" :max="product.units" class="col-md-2 float-left" v-model="quantity" @change="checkUnits"></label>
                </div>
                <br>
                <div>
                    <div v-if="!isLoggedIn">
                        <h2>You need to login to continue</h2>
                        <button class="col-md-4 btn btn-primary float-left" @click="login">Login</button>
                        <button class="col-md-4 btn btn-danger float-right" @click="register">Create an account</button>
                    </div>
                    <div v-if="isLoggedIn">
                        <div class="row">
                            <label for="address" class="col-md-3 col-form-label">Delivery Address</label>
                            <div class="col-md-9">
                            <input id="address" type="text" class="form-control" v-model="address" required>
                            </div>
                         <div ref="card"></div>
                         <button v-on:click="purchase">Purchase</button>
                        </div>
                        <br>
                        <button class="col-md-4 btn btn-sm btn-success float-right" v-if="isLoggedIn" @click="placeOrder">Continue</button>
                    </div>
                    <paypal-checkout
    amount="10.00"
    currency="USD"
    :client="paypal">
  </paypal-checkout>
                </div>
            </div>
        </div>
    </div>
</template>
<script>


    let stripe = Stripe(`pk_test_Cr3UsNpwjxEyin7aZ8vhxa1h00kwcf2NWg`),
    elements = stripe.elements(),
    card = undefined;


    export default {
        mounted: function () {
        card = elements.create('card', style);
        card.mount(this.$refs.card);
  },
        props : ['pid'],
        data(){
            
            return {
                address : "",
                quantity : 1,
                isLoggedIn : null,
                product : []
            }
        },
        mounted(){
            this.isLoggedIn = localStorage.getItem('jwt') != null
        },
        beforeMount(){
            axios.get(`/api/products/${this.pid}`)
            .then(response => {
                this.product = response.data
            })
            .catch(error => {
                console.error(error);
            })       
            if(localStorage.getItem('jwt') != null){
                this.user = JSON.parse(localStorage.getItem('user'))
                axios.defaults.headers.common['Content-Type'] = 'application/json'
                axios.defaults.headers.common['Authorization'] = 'Bearer ' + localStorage.getItem('jwt')
            }
        },
        methods : {
            login(){
                this.$router.push({ name: 'login', params: { nextUrl: this.$route.fullPath }})
            },
            register(){
                this.$router.push({ name: 'register', params: { nextUrl: this.$route.fullPath }})
            },
            purchase(){
                
                let self = this;

  stripe.createToken(stripe).then(function(result) {
    if (result.error) {
      self.hasCardErrors = true;
      self.$forceUpdate(); // Forcing the DOM to update so the Stripe Element can update.
      return;
    }

    });

            },
            placeOrder(e) {
                e.preventDefault()
                axios.post('api/orders/', {
                    address : this.address,
                    quantity: this.quantity,
                    product : this.product.id
                })
                .then(response => {
                    this.$router.push('/confirmation')
                })
                .catch(error => {
                    console.error(error);
                })          
            },
            checkUnits(e){
                if (this.quantity > this.product.units)
                {
                    this.quantity = this.product.units
                }
            }
        }
    }
</script>
<style scoped>
    .small-text {
        font-size: 18px;
    }
    .order-box {
        border: 1px solid #cccccc;
        padding: 10px 15px;
    }
    .title {
        font-size: 36px;
    }
    .checkout-image{
        max-height: 100%;
        max-width: 100%;
    }
    .base{
        border: 1px, solid, #d8d8d8;
        border-radius: 4px;
        columns: #000000;
    }
</style>