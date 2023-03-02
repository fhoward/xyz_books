<template>
    <!-- Navbar -->
    <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start navbar">
          <div class="d-flex align-items-center mb-2 mb-lg-0 text-blue text-decoration-none px-4">
            <img :src="logo" alt="">
          </div>
          
          <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
            <input type="search" class="form-control form-control-light text-bg-light" placeholder="Search..." aria-label="Search">
          </form>
  
          <ul class="nav col-12 col-lg-auto ms-lg-auto mb-2 justify-content-center mb-md-0">
            <li><a href="#" class="nav-link px-4 text-dark-blue">Home</a></li>
            <li><a href="#" class="nav-link px-4 text-blue">Search</a></li>
            <li><a href="#" class="nav-link px-4 text-blue">Rent Textbooks</a></li>
            <li><a href="#" class="nav-link px-4 text-blue">Buy Textbooks</a></li>
            <li><a href="#" class="nav-link px-4 text-blue">Sell Textbooks</a></li>
            <li><a href="#" class="nav-link px-4 ps-1 text-blue">En</a></li>
          </ul>

          <div class="text-end">
            <button type="button" class="btn btn-primary">Contact</button>
          </div>
        </div>
    </div>
    <!-- Navbar -->
</template>
<script>
import logo from '../assets/image/logo.svg'
export default {
    data() {
        return {
          logo
        }
    },

}
</script>
<style>
.navbar{
    height: 80px;
}
</style>