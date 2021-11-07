
function activeMenu(num) {
	var i;
	for (i=1; i < 7; i++) {
		document.getElementById(pe[i].menu).style.background = "#f1f1f1";
		document.getElementById(pe[i].menu).style.color = "black";
	}
	document.getElementById(pe[num].menu).style.background = "firebrick";
	document.getElementById(pe[num].menu).style.color = "white";
}

function changeMenu(num) {
	m = document.querySelector("."+pe[num].menu);
	m.style.backgroundColor = "orange";
}



function changeSamplePath(num) {
	var samplePath;
	
	switch(num){
		case 1:
			samplePath = pe[1].path;
			break;
		case 2:
			samplePath = pe[2].path;
			break;
		case 3:
			samplePath = pe[3].path;
			break;
		case 4:
			samplePath = pe[4].path;
			break;
		case 5:
			samplePath = pe[5].path;
			break;
		case 6:
			samplePath = pe[6].path;
			break;
	}
	document.getElementById('img-ratio').src=samplePath+'PEvLab recent.png';
	document.getElementById('img-recent').src=samplePath+'PEvLab cal active vs raw.png';
	document.getElementById('img-raw').src=samplePath+'PEvLab test vs active cal.png';
	document.getElementById('img-hist').src=samplePath+'hist.png';
	document.getElementById('header-text').innerHTML = "PulpEye Calibrations - " + pe[num].name;
	document.getElementById('slope').innerHTML=pe[num].csf.m;
	document.getElementById('intercept').innerHTML=pe[num].csf.b;
	// activeMenu(num);
	changeMenu(num);
}


