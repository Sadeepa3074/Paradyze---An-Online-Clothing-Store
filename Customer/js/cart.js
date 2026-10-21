// js/cart.js
// Cart data structure
let cartItems = JSON.parse(localStorage.getItem('paradyzeCart')) || [];

// Function to add item to cart
function addToCart(productId, productName, productPrice, productImage) {
    const existingItem = cartItems.find(item => item.id === productId);
    
    if (existingItem) {
        existingItem.quantity += 1;
    } else {
        cartItems.push({
            id: productId,
            name: productName,
            price: productPrice,
            image: productImage,
            quantity: 1
        });
    }
    
    localStorage.setItem('paradyzeCart', JSON.stringify(cartItems));
    
    // Show confirmation
    alert(`${productName} added to cart!`);
    
    // Update cart icon count if available
    updateCartIcon();
}

// Function to update cart icon count
function updateCartIcon() {
    const cartIcon = document.querySelector('.header-icons svn:nth-child(3)');
    if (cartIcon && cartItems.length > 0) {
        // You can add a badge to the cart icon here
        console.log('Cart updated:', cartItems.length, 'items');
    }
}

// Function to get cart count
function getCartCount() {
    return cartItems.reduce((total, item) => total + item.quantity, 0);
}