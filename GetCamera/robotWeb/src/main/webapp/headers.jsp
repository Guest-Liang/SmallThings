<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style type="text/css">
.hero-image {
    background-color: rgba(244, 241, 255, 0);
/*     background-image: url("upload/data/img/Mask.svg"); */
    position: relative;
    width: 1444px;
    height: 150px;
    left: 0;
    right: 0;
    top: 0;
    bottom: 0;
    }

.hero-image h1 {
    position: absolute;
    width: 218px;
    height: 53px;
    left: 183px;
    right: 1043px;
    top: 30px;
    bottom: 67px;

    color: rgb(45, 29, 97);
    font-family: Poppins;
    font-size: 30px;
    font-weight: 600;
    line-height: 100%;
    letter-spacing: 0.3px;
    text-align: center;
    text-transform: capitalize;
    display: flex;
    flex-direction: row;
    align-items: center;
}

.hero-image h2 {
    /* Interested in growing your online presence? */
    position: absolute;
    width: 290px;
    height: 53px;
    left: 456px;
    right: 288px;
    top: 30px;
    bottom: 67px;

    color: rgb(45, 29, 97);
    font-family: Poppins;
    font-size: 30px;
    font-weight: 600;
    line-height: 100%;
    letter-spacing: 0.3px;
    text-align: center;
    text-transform: capitalize;

    display: flex;
    flex-direction: row;
    align-items: center;

}

.hero-image h3 {
    /* Interested in growing your online presence? */
    position: absolute;
    width: 227px;
    height: 53px;
    left: 801px;
    right: 6px;
    top: 30px;
    bottom: 67px;


    color: rgb(45, 29, 97);
    font-family: Poppins;
    font-size: 30px;
    font-weight: 600;
    line-height: 138.7%;
    letter-spacing: 0.3px;
    text-align: center;
    text-transform: capitalize;



    display: flex;
    flex-direction: row;
    align-items: center;
}

.hero-image h4 {
    /* Interested in growing your online presence? */
    position: absolute;
    width: 134px;
    height: 53px;
    left: 1083px;
    right: 227px;
    top: 15px;
    bottom: 67px;

    color: rgb(45, 29, 97);
    font-family: Poppins;
    font-size: 30px;
    font-weight: 600;
    line-height: 100%;
    letter-spacing: 0.3px;
    text-align: center;
    text-transform: capitalize;
    display: flex;
    flex-direction: row;
    align-items: center;
}

.hero-image h1:hover {
    color: #b7afe8;
}

.hero-image h2:hover {
    color: #b7afe8;
}

.hero-image h3:hover {
    color: #b7afe8;
}

.hero-image h4:hover {
    color: #b7afe8;
}		
	
</style>

<div class="hero-image">
<!--     <ul> -->
    <%-- <% if(request.getSession().getAttribute("LOGIN_USER")!=null){ %> --%>
    <a href="profile.jsp"><h1>Homepage</h1></a>
    <a href="history.jsp"><h2>Explore History</h2></a>
    <a href="history_add.jsp"><h3>Add Record</h3></a>
	<a href="logout.jsp"><h4>Logout</h4></a>
    
<!--    <button>购买</button>-->

<!-- </ul> -->
</div>