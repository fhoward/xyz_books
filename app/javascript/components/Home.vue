<template>  
  <template v-if="Object.keys(book).length > 0" >
    <div>
      <Header></Header>
      <Navbar @get-book="getBook"></Navbar>
      <Search :book="book"></Search>
    </div>
  </template>
  <template v-else>
    <div :style="homeStyle">
      <Header></Header>
      <Navbar @get-book="getBook"></Navbar>
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
        <div v-if="books.length > 0" class="row text-center align-items-center">
          <div class="row my-5 py-5">
            <Book v-for="book in books" :key="book.id" :data="book.attributes">
            </Book>
          </div>
        </div>  
      </div>
    </div>
  </template>
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
import Book from './Book.vue'
import Search from './Search.vue'
import { advancePositionWithMutation } from '@vue/compiler-core'

export default { 
  components:{
    Header,
    Navbar,
    Book
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
    books: [],
    book: {},
   }  
  },
  async mounted() {
    await this.fetchBooks()
  },
  methods: {
    async fetchBooks(){
      let response = await axios.get('http://localhost:5100/api/books?limit=3',null)
      this.books = response.data.data
      console.log(this.books)
    },
    calculateISBN13CheckDigit(isbn) {
      let sum = 0;
      for (let i = 0; i < 12; i++) {
        let digit = parseInt(isbn.charAt(i));
        let weight = i % 2 === 0 ? 1 : 3;
        sum += digit * weight;
      }
      let checkDigit = (10 - (sum % 10)) % 10;
      return checkDigit;
    },
    async isValidIsbn(val){
      // remove hypen
      let isbn = val.replace(/-/g, '');
      let checkDigit = this.calculateISBN13CheckDigit(isbn)
      // Check that the input has exactly 13 digits
      if (isbn.length !== 13) {
        return false;
      }

      if(!/^978\d{10}$/.test(isbn)){
        return false
      }

      if (!(0 <= checkDigit && checkDigit <= 9)) {
        return false;
      }
      
      return true

    },
    async getBook(isbn){
      let isValidISBN = await this.isValidIsbn(isbn)
      if(isValidISBN){
        axios.get('http://localhost:5100/api/books/' + isbn, null).then((response) => {
          this.book = response.data.data
        }).catch((e) => {
          alert('Book Not Found')
        })
      }else{
        alert('Invalid ISBN')
      }

      console.log(this.book)
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
  .diagonal-box {
    background-color: darkblue;
    transform: skewY(-5deg);
    height: 1000px;
  }
</style>