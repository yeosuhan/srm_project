function loadFile(input) {
	 $(".Img").remove();	
    var file = input.files[0];

    var newImage = document.createElement("img");
    newImage.setAttribute("class", 'img');

    newImage.src = URL.createObjectURL(file);   

    newImage.style.width = "400px";
    newImage.style.height = "400px";
    $("#defaultImage").remove();
    $("#addImg").hide();
    newImage.style.objectFit = "contain";
    $("#newImg").append(newImage);	
};