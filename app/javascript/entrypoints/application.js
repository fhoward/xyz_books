import { createApp } from 'vue/dist/vue.esm-bundler';  
import Home from '../components/Home.vue';
import Search from '../components/Search.vue'
const app = createApp({})  

app.component('Home', Home);
app.component('Search',Search);
app.mount('#app');  

