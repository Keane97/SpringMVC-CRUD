<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>  
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html>
    <head>
    </head>


    <form:form method="POST" action="/TasteLimerickBeers/Brewery/AddBrewery" modelAttribute="Breweries">

        <table>
            <tr style="display: none;">
                <td><form:label path="id">id</form:label></td>
                <td><form:input path="id"/></td>
                <td style="color:red"><form:errors path="id"/></td>
            </tr>
            <tr>
                <td><form:label path="name">name</form:label></td>
                <td><form:input path="name"/></td>
                <td style="color:red"><form:errors path="name"/></td>
            </tr>
            <tr>
                <td><form:label path="address1">Address1</form:label></td>
                <td><form:input path="address1"/></td>
                <td style="color:red"><form:errors path="address1"/></td>
            </tr>
            <tr>
                <td><form:label path="address2">Address2</form:label></td>
                <td><form:input path="address2"/></td>
                <td style="color:red"><form:errors path="address2"/></td>
            </tr>
            <tr>
                <td><form:label path="city">City</form:label></td>
                <td><form:input path="city"/></td>
                <td style="color:red"><form:errors path="city"/></td>
            </tr>
            <tr>
                <td><form:label path="state">State</form:label></td>
                <td><form:input path="state"/></td>
                <td style="color:red"><form:errors path="state"/></td>
            </tr>
            <tr>
                <td><form:label path="code">Code</form:label></td>
                <td><form:input path="code"/></td>
                <td style="color:red"><form:errors path="code"/></td>
            </tr>
            <tr>

                <td><form:label path="country">Country</form:label></td>
                <td><form:input path="country"/></td>
                <td style="color:red"> <form:errors path="country"/> </td>

            </tr>
            <tr>
                <td><form:label path="phone">Phone</form:label></td>
                <td><form:input path="phone"/></td>
                <td style="color:red"> <form:errors path="phone"/> </td>
            </tr>
            <tr>
                <td><form:label path="website">Website</form:label></td>
                <td><form:input path="website"/></td>
                <td style="color:red"> <form:errors path="website"/> </td>
            </tr>
            <tr>
                <td><form:label path="image">Image</form:label></td>
                <td><form:input path="image" value="no_image.jpg" readonly="true"/></td>
                <td style="color:red"> <form:errors path="image"/> </td>
            </tr>
            <tr>
                <td><form:label path="description">Description</form:label></td>
                <td><form:input path="description"/></td>
                <td style="color:red"> <form:errors path="description"/> </td>
            </tr>
            <tr>
                <td><form:label path="addUser">Add User</form:label></td>
                <td><form:input path="addUser"/></td>
                <td style="color:red"> <form:errors path="addUser"/> </td>
            </tr>
            <tr>
                <td><form:label path="creditLimit">Credit Limit</form:label></td>
                <td><form:input path="creditLimit"/></td>
                <td style="color:red"> <form:errors path="creditLimit"/> </td>
            </tr>
            <tr>
                <td><form:label path="email">Email</form:label></td>
                <td><form:input path="email"/></td>
                <td style="color:red"> <form:errors path="email"/> </td>
            </tr>
            <tr>
                <td><form:label path="longitude">Longitude</form:label></td>
                <td><form:input path="longitude"/></td>
                <td style="color:red"> <form:errors path="longitude"/> </td>
            </tr>
            <tr>
                <td><form:label path="latitude">Latitude</form:label></td>
                <td><form:input path="latitude"/></td>
                <td style="color:red"> <form:errors path="latitude"/> </td>
            </tr>
            <tr>
                <td><input type="submit" value="Submit!"/></td>
                <spring:url value="/Brewery/AllBreweries" var="HomeURL"/>
                <td><button><a href="${HomeURL}">Home</a></Button></td>
                 
                        
            </tr>
        </table>
    </form:form>


</html>