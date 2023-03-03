<template>  
    <div class="container">
      <div class="row row-1 align-items-center">
        <div class="col ">
          <img :src="book.attributes.image_url" class="book-image img-thumbnail">
        </div>
        <div class="col text-left">
          <h2>{{book.attributes.title}}</h2>
          <br/>
          <h5>By {{ book.attributes.authors }}</h5>
          <br/>
          <h5>Edition: <span> {{ book.attributes.edition }} </span> </h5>
          <h5>Price: <span>{{ book.attributes.price }}</span> </h5>
          <h5>ISBN: <span> {{ book.attributes.isbn_13 }}</span> </h5>
          <h5>Publication Year: <span> {{ book.attributes.publication_year }} </span> </h5>
          <h5>Publisher: <span> {{ book.attributes.publisher_name }} </span> </h5>
          
        </div>
      </div>
    </div>
</template>  
  
<script>  

export default { 
components:{

},
props: ['book'],
data() {  
    return {  

    }  
},
computed: {

} 
}  
</script>  
<style>
.book-image{
  height: 500px;
  width: 400px;
}
h5 span{
  color: blue;
}
</style>