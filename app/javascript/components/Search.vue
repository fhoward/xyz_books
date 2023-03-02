<template>  
    <div :style="homeStyle">
      <Header></Header>
      <Navbar></Navbar>
      <div class="container text-center">
        <div class="row">
          <div class="col">
            Columnas
          </div>
          <div class="col">
            Cols
          </div>
        </div>
      </div>
    </div>
</template>  
  
<script>  
import Header from './Header.vue'
import bgImage from '../assets/image/banner.png'
import Navbar from './Navbar.vue'

export default { 
components:{
    Header,
    Navbar
},
data() {  
    return {  
    bgImage
    }  
},
computed: {
    homeStyle(){
        return {
            backgroundImage: `url(${this.bgImage})`,
            backgroundSize: 'cover',
            width: '100vw',
            height: '200vh'
        }
    }
} 
}  
</script>  
