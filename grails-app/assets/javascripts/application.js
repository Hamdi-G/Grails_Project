// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better
// to create separate JavaScript files as needed.
//
//= require_self















var options = {
    "decimal": "",
    "emptyTable": "aucune donnée disponible",
    "info": "Affichage de _START_ à _END_ de _TOTAL_ entrées",
    "infoEmpty": "Affichage de 0 à 0 de 0 entrées",
    "infoFiltered": "(filtré de _MAX_ entrées totales)",
    "infoPostFix": "",
    "thousands": ",",
    "lengthMenu": "Afficher _MENU_ entrées",
    "loadingRecords": "Chargement...",
    "processing": "Traitement...",
    "search": "Chercher:",
    "zeroRecords": "Aucun enregistrements correspondants trouvés",
    "paginate": {
        "first": "Premier",
        "last": "Dernier",
        "next": "Suivant",
        "previous": "Précédent"
    },
    "aria": {
        "sortAscending": ": activer pour trier la colonne en ordre croissant",
        "sortDescending": ": activer pour trier la colonne en ordre decroissant"
    }
}





//adresse de poi depuis lng & lat
function geo(poi) {
    var address
    var geocoder = new google.maps.Geocoder;
    var latlng = {
        lat: poi.lat,
        lng: poi.lng
    };
    geocoder.geocode({
        'location': latlng
    }, function(results, status) {
        if (status === 'OK') {
            if (results[1]) {
                address = (results[1].formatted_address);
                // Check if all calls have been processed
                    someOtherFunction(address,poi);

            } else {
                address = "non définie"
                    someOtherFunction(address,poi);
            }
        } else {
            address = "non définie"
                someOtherFunction(address,poi);

        }
    });
}

function someOtherFunction(address,poi) {
    var idd = '#'.concat(poi.id)
    $(idd).append('<i class="material-icons">place</i>' + address);


}




function geo2(lat,lng) {
    var address
    var geocoder = new google.maps.Geocoder;
    var latlng = {
        lat: lat,
        lng: lng
    };
    geocoder.geocode({
        'location': latlng
    }, function(results, status) {
        if (status === 'OK') {
            if (results[1]) {
                address = (results[0].formatted_address);
                // Check if all calls have been processed
                someOtherFunction2(address);

            } else {
                address = "non définie"
                someOtherFunction2(address);
            }
        } else {
            address = "non définie"
            someOtherFunction2(address);

        }
    });
}

function someOtherFunction2(address) {
    var idd = '#address'
    $(idd).append(address);


}

// localisation d'utilisateur
function getLocation(map_) {
    var infoWindow = new google.maps.InfoWindow({
        map: map_
    });
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(position) {
            var pos = {
                lat: position.coords.latitude,
                lng: position.coords.longitude
            };

            infoWindow.setPosition(pos);
            infoWindow.setContent('Vous êtes ici.');
            map_.setCenter(pos);
        }, function() {
            handleLocationError(true, infoWindow, map_.getCenter());
        });
    } else {
        // Browser doesn't support Geolocation
        handleLocationError(false, infoWindow, map_.getCenter());
    }

    function handleLocationError(browserHasGeolocation, infoWindow, pos) {
        alert('Error: Your browser doesn\'t support geolocation.');
    }
}


/*



function sendFileToServer(formData, status) {
    var uploadURL = ""; //Upload URL
    var extraData = {}; //Extra Data.
    var jqXHR = $.ajax({
        xhr: function() {
            var xhrobj = $.ajaxSettings.xhr();
            if (xhrobj.upload) {
                xhrobj.upload.addEventListener('progress', function(event) {
                    var percent = 0;
                    var position = event.loaded || event.position;
                    var total = event.total;
                    if (event.lengthComputable) {
                        percent = Math.ceil(position / total * 100);
                    }
                    //Set progress
                    status.setProgress(percent);
                }, false);
            }
            return xhrobj;
        },
        url: uploadURL,
        type: "POST",
        contentType: false,
        processData: false,
        cache: false,
        data: formData,
        success: function(data) {
            status.setProgress(100);

            $("#status1").append("File upload Done<br>");
        }
    });

    status.setAbort(jqXHR);
}

var rowCount = 0;

function createStatusbar(obj) {
    rowCount++;
    var row = "odd";
    if (rowCount % 2 == 0) row = "even";
    this.statusbar = $("<div class='statusbar " + row + "'></div>");
    this.filename = $("<div class='filename'></div>").appendTo(this.statusbar);
    this.size = $("<div class='filesize'></div>").appendTo(this.statusbar);
    this.progressBar = $("<div class='progressBar'><div></div></div>").appendTo(this.statusbar);
    this.abort = $("<div class='abort'>Abort</div>").appendTo(this.statusbar);
    obj.after(this.statusbar);

    this.setFileNameSize = function(name, size) {
        var sizeStr = "";
        var sizeKB = size / 1024;
        if (parseInt(sizeKB) > 1024) {
            var sizeMB = sizeKB / 1024;
            sizeStr = sizeMB.toFixed(2) + " MB";
        } else {
            sizeStr = sizeKB.toFixed(2) + " KB";
        }

        this.filename.html(name);
        this.size.html(sizeStr);
        //$("#images").val(name);
    }
    this.setProgress = function(progress) {
        var progressBarWidth = progress * this.progressBar.width() / 100;
        this.progressBar.find('div').animate({
            width: progressBarWidth
        }, 10).html(progress + "% ");
        if (parseInt(progress) >= 100) {
            this.abort.hide();
        }
    }
    this.setAbort = function(jqxhr) {
        var sb = this.statusbar;
        this.abort.click(function() {
            jqxhr.abort();
            sb.hide();
        });
    }
}

function handleFileUpload(files, obj) {
    var list = [];
    for (var i = 0; i < files.length; i++) {
        var fd = new FormData();
        fd.append('file', files[i]);

        var status = new createStatusbar(obj); //Using this we can set progress.
        status.setFileNameSize(files[i].name, files[i].size);
        //list.push(files[i].name);
        $("#image1").val(files[i].name + " " + document.getElementById("image1").value)
        sendFileToServer(fd, status);
    }

    //$("#image1").val(list[0]);
}
$(document).ready(function() {
    var obj = $("#dragandrophandler");
    obj.on('dragenter', function(e) {
        e.stopPropagation();
        e.preventDefault();
        $(this).css('border', '2px solid #0B85A1');
    });
    obj.on('dragover', function(e) {
        e.stopPropagation();
        e.preventDefault();
    });
    obj.on('drop', function(e) {

        $(this).css('border', '2px dotted #0B85A1');
        e.preventDefault();
        var files = e.originalEvent.dataTransfer.files;

        //We need to send dropped files to Server
        handleFileUpload(files, obj);
    });
    $(document).on('dragenter', function(e) {
        e.stopPropagation();
        e.preventDefault();
    });
    $(document).on('dragover', function(e) {
        e.stopPropagation();
        e.preventDefault();
        obj.css('border', '2px dotted #0B85A1');
    });
    $(document).on('drop', function(e) {
        e.stopPropagation();
        e.preventDefault();
    });
});*/

