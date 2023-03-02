<template>  
  <div :style="homeStyle">
    <Header></Header>
    <Navbar></Navbar>
    <div class="container">
      <div class="row row-1 align-items-center">
        <div class="col my-5 text-left">
          <h1 class="my-5 header">The Cheapest Textbooks</h1>
          <h5 class="my-5 sub-header">Save Up To 90% On Millions Of Titles</h5>
          <p class="my-5 description">Lorem ipsum dolor sit amet, consetetur sadipscing elitr,
            sed diam nonumy eirmod tempor invidunt ut labore et
            dolore magna.</p>
        </div>
        <div class="col my-5">
          <img :src="heroImage" class="home-image">
        </div>
      </div>
      <br>
      <div class="row row-2 align-items-center">
        <div class="col my-5">
          <img :src="groupImg" class="home-image">
        </div>
        <div class="col my-5 text-left text-white">
          <h1 class="my-5 header">Our Commitment</h1>
          <p class="my-5 description">Lorem ipsum dolor sit amet, consetetur sadipscing elitr,
            sed diam nonumy eirmod tempor invidunt ut labore et
            dolore magna aliquyam erat, sed diam voluptua. At
            vero eos et accusam et justo duo dolores et ea rebum</p>
        </div>
      </div>
      <div class="row">
        <div class="col">
          <h2 class="text-center text-white p-5">Trusted By Awesome Clients</h2>
          <ul class="nav col-12 col-lg-auto ms-lg-auto mb-2 justify-content-center mb-md-0">
            <li class="px-4"><img :src="binance" class="partner-image px-3">Binance</li>
            <li class="px-4"><img :src="bitcoin" class="partner-image px-3">Bitcoin</li>
            <li class="px-4"><img :src="tether" class="partner-image px-3">Tether</li>
            <li class="px-4"><img :src="xrp" class="partner-image px-3">Ripple</li>
            <li class="px-4"><img :src="sol" class="partner-image px-3">Solana</li>
            <li class="px-4"><img :src="eth" class="partner-image px-3">Ethereum</li>
          </ul>
        </div>
      </div>
    </div>

  </div>
  <div>
    <div class="container">
      <div class="row text-center align-items-center book-title">
        <div class="col">
          <h1>Explore Our Books</h1>
          <span class="mx-5">With our dedicated customer support team, you can rest easy knowing that we’re doing everything
          </span>
          <br/>
          <span class="mx-5"> we can to save you time, money, and stress.</span>
        </div>
      </div>
      <div class="row text-center align-items-center">
        <div v-if="books.length > 0" class="row">
          <div class="col">
            yawaa
          </div>
        </div>
      </div>  
    </div>
  </div>
</template>  

<script>  
import Header from './Header.vue'
import Navbar from './Navbar.vue'
import bgImage from '../assets/image/banner.png'
import heroImage from '../assets/image/hero.svg'
import groupImg from '../assets/image/groupsample.png'
import binance from '../assets/image/binance.svg'
import eth from '../assets/image/ethereum.svg'
import bitcoin from '../assets/image/bitcoin.svg'
import tether from '../assets/image/tether.svg'
import sol from '../assets/image/solana.svg'
import xrp from '../assets/image/xrp.svg'
import axios from 'axios';

export default { 
  components:{
    Header,
    Navbar
  },
  data() {  
   return {  
    bgImage,
    heroImage,
    groupImg,
    binance,
    eth,
    bitcoin,
    tether,
    sol,
    xrp,
    books: []
   }  
  },
  async mounted() {
    await this.fetchBooks()
  },
  methods: {
    async fetchBooks(){
      let response = await axios.get('http://localhost:5100/api/books')
      this.books = response.data.data

      console.log(console.log)
    }
  },
  computed: {
    homeStyle(){
        return {
            backgroundImage: `url(${this.bgImage})`,
            backgroundSize: 'cover',
            width: '100vw',
            height: '190vh'
        }
    }
  } 
}  
</script>  
<style>
  .header{
    font-size: 70px;
  }
  .sub-header{
    font-size: 30px;
  }
  .description{
    font-size: 20px;
  }
  .home-image{
    height: 500px;
  }
  .row-1{
    height: 80vh;
  }
  .book-title{
    height: 300px;
  }
</style>