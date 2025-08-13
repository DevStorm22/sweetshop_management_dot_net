<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" CodeBehind="indexpage.aspx.cs" Inherits="sweetShopManagementSystem.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel = "stylesheet" href = "indexpagestyle.css" type = "text/css" />
    <link rel = "stylesheet" href = "masterpagestyle.css" type = "text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Hero Section -->
    <section class = "hero-section">
        <div class = "hero-content">
            <h1>Indulge in the Sweetest Treats</h1>
            <p>Discover a world of sweetness handcrafted with love.</p>
            <div class = "hero-buttons">
                <a href = "menupage.aspx" class = "btn primary-btn">Explore Our Menu</a>
                <a href = "indexpage.aspx#offers" class = "btn secondary-btn">View Special Offers</a>
            </div>
        </div>
    </section>

    <!-- About Section -->
    <section class = "about-section" id = "about">
        <div class = "about-content">
            <h2>Our Story</h2>
            <p>At SweetShop, we believe in creating a magical experience with every bite. Our sweets are made with the finest ingredients, ensuring that each treat is not only delicious but also crafted with love. From traditional classics to innovative new flavors, our passion for sweets is reflected in every creation.</p>
            <p>Founded in 2024, our mission has always been to bring joy and sweetness to every occasion. Whether you’re visiting our shop or ordering online, you can expect high-quality, freshly made sweets that will satisfy your cravings.</p>
        </div>
    </section>

    <!-- Products/Menu Highlights Section -->
    <section class = "menu-section" id = "products">
        <div class = "menu-container">
            <h2>Our Sweet Creations</h2>
            <div class="menu-grid">
                <!-- Product 1 -->
                <div class = "menu-item">
                    <img src = "Deliciouscake.jpg" alt = "Delicious Cake">
                    <h3>Delicious Cake</h3>
                    <p>A perfect blend of creamy layers and rich flavors.</p>
                </div>
                <!-- Product 2 -->
                <div class = "menu-item">
                    <img src = "ChocolateDelight.jpg" alt = "Chocolate Delight">
                    <h3>Chocolate Delight</h3>
                    <p>Indulge in a chocolate lover's dream with this rich treat.</p>
                </div>
                <!-- Product 3 -->
                <div class = "menu-item">
                    <img src = "Deliciouscake.jpg" alt = "Traditional Sweets">
                    <h3>Traditional Sweets</h3>
                    <p>A taste of classic goodness with a modern twist.</p>
                </div>
                <!-- Product 4 -->
                <div class = "menu-item">
                    <img src = "FruitTart.jpg" alt = "Fruit Tart">
                    <h3>Fruit Tart</h3>
                    <p>Fresh fruits and creamy custard in a crisp tart shell.</p>
                </div>
            </div>
            <br />
            <a href = "menupage.aspx" class = "btn view-menu-btn">View Full Menu</a>
        </div>
    </section>

    <!-- Special Offers Section -->
    <section class = "special-offers-section" id = "offers">
        <div class = "offers-container">
            <h2>Exclusive Special Offers</h2>
            <div class = "offers-grid">
                <!-- Offer 1 -->
                <div class = "offer-item">
                    <h3>Buy 1 Get 1 Free</h3>
                    <p>Available on selected cakes and desserts. Grab this amazing deal today!</p>
                    <a href = "menupage.aspx" class = "btn offer-btn">Shop Now</a>
                </div>
                <!-- Offer 2 -->
                <div class = "offer-item">
                    <h3>20% Off All Orders</h3>
                    <p>Use code SWEET20 at checkout to enjoy a 20% discount on all orders!</p>
                    <a href = "menupage.aspx" class = "btn offer-btn">Order Now</a>
                </div>
                <!-- Offer 3 -->
                <div class = "offer-item">
                    <h3>Free Delivery</h3>
                    <p>Get free delivery on all orders above $50. Satisfy your cravings without any extra cost!</p>
                    <a href = "menupage.aspx" class = "btn offer-btn">Order Now</a>
                </div>
            </div>
        </div>
    </section>

    <!-- Testimonials/Reviews Section -->
    <section class = "reviews-section" id = "reviews">
        <div class = "reviews-container">
            <h2>What Our Customers Say</h2>
            <div class = "reviews-grid">
                <!-- Review 1 -->
                <div class = "review-item">
                    <p>"The best sweets I've ever tasted! The quality and freshness are simply unmatched. Highly recommend!"</p>
                    <h4>- Sarah J.</h4>
                </div>
                <!-- Review 2 -->
                <div class = "review-item">
                    <p>"Amazing service and delicious treats. The chocolate delights are my personal favorite!"</p>
                    <h4>- Mark T.</h4>
                </div>
                <!-- Review 3 -->
                <div class = "review-item">
                    <p>"SweetShop has become my go-to place for all celebrations. Their sweets are always a hit!"</p>
                    <h4>- Emily R.</h4>
                </div>
                <!-- Review 4 -->
                <div class = "review-item">
                    <p>"Every bite is heavenly! The perfect blend of flavors, and the staff is so friendly."</p>
                    <h4>- John W.</h4>
                </div>
            </div>
        </div>
    </section>

    <!-- Sweet Shop Location & Contact Section -->
    <section class = "contact-section" id = "contact">
        <div class = "contact-container">
            <h2>Find Us & Get in Touch</h2>
            <div class = "contact-info-grid">
                <!-- Location Details -->
                <div class = "location-details">
                    <h3>Our Location</h3>
                    <p>Jagannath Sweet Shop, Kuwarbav Stop, Ratnagiri, 415639</p>
                    <p>Opening Hours:<br>9 AM - 8 PM</p>
                    <iframe src = "https://www.google.com/maps/embed" width = "100%" height = "250" style = "border:0;" allowfullscreen = "" loading = "lazy"></iframe>
                </div>

                <!-- Contact Form -->
                <div class = "contact-form">
                    <h3>Contact Us</h3>
                    <form action = "#" method = "POST">
                        <div class = "form-group">
                            <input type = "text" name = "name" placeholder = "Your Name" required>
                        </div>
                        <div class = "form-group">
                            <input type = "email" name = "email" placeholder = "Your Email" required>
                        </div>
                        <div class = "form-group">
                            <textarea name = "message" placeholder = "Your Message" rows = "5" required></textarea>
                        </div>
                        <button type = "submit" class = "btn submit-btn">Send Message</button>
                    </form>
                </div>
            </div>
        </div>
    </section>

    <!-- Instagram/Social Media Feed Section -->
    <section class = "social-media-section" id = "social">
        <div class = "social-media-container">
            <h2>Follow Us on Instagram</h2>
            <div class = "social-media-grid">
                <!-- Instagram Post 1 -->
                <div class = "social-media-item">
                    <img src = "https://via.placeholder.com/250" alt = "Instagram post 1">
                    <div class = "overlay">
                        <a href = "https://www.instagram.com" target = "_blank" class = "social-link">@sweetshop</a>
                    </div>
                </div>
                <!-- Instagram Post 2 -->
                <div class = "social-media-item">
                    <img src = "https://via.placeholder.com/250" alt = "Instagram post 2">
                    <div class = "overlay">
                        <a href = "https://www.instagram.com" target = "_blank" class = "social-link">@sweetshop</a>
                    </div>
                </div>
                <!-- Instagram Post 3 -->
                <div class = "social-media-item">
                    <img src = "https://via.placeholder.com/250" alt = "Instagram post 3">
                    <div class = "overlay">
                        <a href = "https://www.instagram.com" target = "_blank" class = "social-link">@sweetshop</a>
                    </div>
                </div>
                <!-- Instagram Post 4 -->
                <div class = "social-media-item">
                    <img src = "https://via.placeholder.com/250" alt = "Instagram post 4">
                    <div class = "overlay">
                        <a href = "https://www.instagram.com" target = "_blank" class = "social-link">@sweetshop</a>
                    </div>
                </div>
                <!-- Instagram Post 5 -->
                <div class = "social-media-item">
                    <img src = "https://via.placeholder.com/250" alt = "Instagram post 5">
                    <div class = "overlay">
                        <a href = "https://www.instagram.com" target = "_blank" class = "social-link">@sweetshop</a>
                    </div>
                </div>
                <!-- Instagram Post 6 -->
                <div class = "social-media-item">
                    <img src = "https://via.placeholder.com/250" alt = "Instagram post 6">
                    <div class = "overlay">
                        <a href = "https://www.instagram.com" target = "_blank" class = "social-link">@sweetshop</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>