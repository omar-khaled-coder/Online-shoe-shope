<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="thankyou.aspx.cs" Inherits="WebApplication2_database_members_lesson.thankyou" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <style>
@import url('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css');

.thank-you-container {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    height: 80vh;
    background: #f5f5f5; /* Light gray background for a clean look */
    border-radius: 10px;
    padding: 20px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    text-align: center;
}

.thank-you-icon {
    font-size: 4rem; /* Larger size for the icon */
    color: #28a745; /* Green color for success */
    margin-bottom: 20px;
}

.thank-you-text {
    font-size: 3rem; /* Larger font size for main message */
    font-weight: bold; /* Bold text for emphasis */
    color: #333; /* Dark text for contrast */
    margin-bottom: 10px;
    font-family: 'Arial', sans-serif;
}

.thank-you-subtext {
    font-size: 1.5rem; /* Smaller font size for subtext */
    color: #666; /* Gray text for subtext */
    margin: 5px 0;
    font-family: 'Arial', sans-serif;
}

@media (max-width: 600px) {
    .thank-you-container {
        padding: 10px;
    }

    .thank-you-icon {
        font-size: 3rem;
    }

    .thank-you-text {
        font-size: 2.5rem;
    }

    .thank-you-subtext {
        font-size: 1.2rem;
    }
}

   </style>
    
    
    
    <div class="thank-you-container">
        <div class="thank-you-icon">
            <i class="fas fa-check-circle"></i>
        </div>
        <h1 class="thank-you-text">Thank You</h1>
        <p class="thank-you-subtext">For Your Purchase</p>
        <p class="thank-you-subtext">We appreciate your business!</p>
    </div>
</asp:Content>
