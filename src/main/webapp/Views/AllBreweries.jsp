<%-- 
    Document   : AllBreweries
    Created on : 4 Mar 2020, 16:18:50
    Author     : Keane
--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <table border="1">
            <tr>
                <td>ID</td>
                <td>Name</td>
                <td>Address1</td>
                <td>Address2</td>
                <td>City</td>
                <td>State</td>
                <td>Code</td>
                <td>Country</td>
                <td>Phone</td>
                <td>Website</td>
                <td>Image</td>
                <td>Description</td>
                <td>Add User</td>
                <td>Last Mod</td>
                <td>Credit Limit</td>
                <td>Email</td>
                <td>Actions</td>
            </tr>
            <c:forEach items="${BreweryList}" var="Brewery"> 

                <tr>
                    <td>${Brewery.id}</td>
                    <td>${Brewery.name}</td>
                    <td>${Brewery.address1}</td>
                    <td>${Brewery.address2}</td>
                    <td>${Brewery.city}</td>
                    <td>${Brewery.state}</td>
                    <td>${Brewery.code}</td>
                    <td>${Brewery.country}</td>
                    <td>${Brewery.phone}</td>
                    <td>${Brewery.website}</td>
                    <td><img src="../assets/images/no_image.jpg" alt="image"/></td>
                    <td>${Brewery.description}</td>
                    <td>${Brewery.addUser}</td>
                    <td>${Brewery.lastMod}</td>
                    <td>${Brewery.creditLimit}</td>
                    <td>${Brewery.email}</td>
                    <td>
                        <spring:url value="/Brewery/edit/${Brewery.id}" var="EditURL"/>
                        <spring:url value="/Brewery/add" var="InsertURL"/>
                        <spring:url value="/Brewery/delete/${Brewery.id}" var="DeleteURL" />
                        <a href="${DeleteURL}"  onclick="return confirmDelete('Are You sure you want to delete this ${Brewery.name}')">Delete</a>
                        <a href="${EditURL}">Edit</a>
                        <a href="${InsertURL}">Insert</a>
                    </td>

                </tr>
            </c:forEach>
        </table>
        <script>
            function confirmDelete(message) {
                return confirm(message);
            }
        </script>
    </body>
</html>