/** its all about you **/
    function addcart(id,name,price){
    	 
    	let cart=localStorage.getItem("cart");
       if(cart==null){
    		   let products=[];
    		 let product={pid: id,pname:name,pqun:1,pprice:price};
    		     products.push(product);
    			localStorage.setItem("cart",JSON.stringify(products));
    			console.log("Product  is  addded first time");
    			myFunction('Product add to cart')
    	   }
    	   else{
    		   let pcart=JSON.parse(cart);
    		   
    		   let oldproduct=pcart.find((item) => item.pid==id);
    		     if(oldproduct){
    		    	 
    		    	 oldproduct.pqun=oldproduct.pqun + 1
    		    	    pcart.map((item)=>{
    		    	     if(item.pid === oldproduct.pid)
    		    	     {
      		    	    	item.pqun=oldproduct.pqun;
    		    	      }
    		    	     
    		    	  }) 
    		    	    localStorage.setItem("cart",JSON.stringify(pcart));
    		    	         console.log("Product  is incresed");
    		    	         myFunction('Product  is incresed')
    		    	 
    		     }else{
    		    	 let product={pid: id,pname:name,pqun:1,pprice:price};
        		     pcart.push(product);
        			 localStorage.setItem("cart",JSON.stringify(pcart));
        			 console.log("Product  is  addded ");  	     		    	 
        			 myFunction('Product added ')
    		     }
    		   
    	   }
    }
    
    //Update cart:
       
   function updatecart(){
	   
	 let cartstring = localStorage.getItem("cart");
	   let cart=JSON.parse(cartstring);
	   
	  if(cart==null || cart.length==0){
		  
		  console.log("Cart is Empty");
		  $(".card-bod").html("<h3>Cart have no items </h3>");
		  $(".plo").html("<a href='index.jsp' class='text-decoration-none'>ShopNow</a>")
		  
		  
	  }else{
		  
		  //there is something in cart
		  console.log(cart);	 
		  $(".cad-ite").html(`(${cart.length})`);	  
		  
		  let cards=
			     `<table class='table'>
		        <thread class='thread-light'>
		          <tr>
                   <th>Item name </th>
                   <th>Price</th>
                   <th>Quantity</th>
                   <th>Total price</th>
                   <th>Action</th>
		        </tr>`;
		  
		     let totalprice=0;
		     cart.map((item)=>{
		        	
		        	cards+= `<tr>
		        	         <td>${item.pname}</td>
		        	         <td>${item.pprice}</td>
		        	         <td>${item.pqun}</td>
		        	         <td>${item.pqun * item.pprice}</td>	
		        	         <td><button onclick='deletefromcart(${item.pid})' class='btn btn-outline-danger'>Remove</button></td>
		        	        <tr>`
		       totalprice+=item.pprice*item.pqun;
		        })
		  cards=cards +`</table>`
		  $(".card-bod").html(cards);
		  $(".amnt").html(`${totalprice}`);
		 	 
	  }
	 
	 
   }
   
   
     $(document).ready(function(){
    	  updatecart()
     })   
     
     
     
      function deletefromcart(id){  
	  let cate= JSON.parse(localStorage.getItem('cart'));
	     let newcart =cate.filter((item) =>item.pid !=id)
	    localStorage.setItem('cart',JSON.stringify(newcart))
	      updatecart();
	     myFunction('Product Remove')
   }
     function myFunction(content) {
    	    $('#snackbar').addClass("display");
    	    $('#snackbar').html(content);
    	     
    	    setTimeout(() => {
    	        $('#snackbar').removeClass("display");
    	    }, 2000);

    	 }
     
   function transfer(){
	  window.location="Checkout.jsp";
   }
   