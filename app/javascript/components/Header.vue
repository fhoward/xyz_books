<template>
    <div :style="headerStyle">
        <p id="header-title">Save up to $500 per year on millions of book titles!</p>
    </div>
</template>
<script>
import headerImg from '../assets/image/header.png'
import logo from '../assets/image/logo.svg'

export default {
    data() {
        return {
          headerImg,
          logo
        }
    },
    computed: {
        headerStyle(){
            return {
                backgroundImage: `url(${this.headerImg})`,
                backgroundSize: 'cover',
                width: '100%',
                height: '50px'
            }
        }
    }
}
</script>
<style>
    #header-title{
        text-align: center;
        position: absolute;
        width: 100%;
        color: white;
        font-size: 18px;
        font-family: sans-serif;
        top: 10px;
    }
</style>