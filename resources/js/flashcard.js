	$(document).ready(function() {
		$("#profile").prop("disabled", true);
		//set submitflag true (disable submit form)
		var submitflag=true;
		$("#changepasswordbutton").click(function() {
			$("#changePasswordModal").modal('show');
			$("#errorChangePassword").html('');
			document.getElementById("changePasswordForm").reset();
		});

		$.ajax({
			url : "resources/js/loginscript.js",
			dataType : "script"
		});
		//when form submit add class flipable
		$("#flashcardshowanswer").click(function() {
			$("#flipid").addClass('flipable');
		});
		//submit form event
		$("#flashcardform").submit(function(e) {
			e.preventDefault();
			if(submitflag == true){
				return;
			}
			//check answer
			if($("#inputword").val() == $("#backword").text()){
				var correctanswer = parseInt($("#correctanswer").text(),10);
				correctanswer++;
				$("#correctanswer").text(correctanswer+'/');
				$("#correct").trigger('play');
				submitflag = true;
				$("#flipid").addClass('flipable');
			}
			else{
				$("#wrong").trigger('play');
			}
			$("#inputword").val('');
			$('#wordenglishmean').attr('hidden','');
			
		});
		$("#showhelp").click(function(){
			$('#englishmean').removeAttr("hidden");
		});
		//hover back face of flashcard event
		$("#backflashcard").hover(function(){
			$("#backcardsound").trigger('play');
		});
		$("#flashcardhelper").click(function(){
			$('#wordenglishmean').removeAttr('hidden');
		});
		//click next flashcard
		$("#nextflashcard").click(function() {
			$.ajax({
				url : "getrandomflashcard",
				type : "post",
				data : "level=" + $("#flashcardlevel").text(),
				dataType:"json"
			}).done(function(data) {
				submitflag = false;
				var numberofquestion = parseInt($("#numberofquestion").text(),10);
				numberofquestion++;
				$("#numberofquestion").text(numberofquestion);
				$("#nextflashcard").text("Next");
				$("#flipid").removeClass('flipable');
				$("#word").html('');
				$("#word").append("<h3><strong>"+data.flashCardWord+"</strong></h3>");
				$("#wordpronunciation").html('');
				$("#wordpronunciation").append("<h4><i>"+data.flashCardWordPronunciation+"</i></h4>");
				$("#wordenglishmean").html('');
				$('#wordenglishmean').attr('hidden','');
				$("#wordenglishmean").append("<h5 id='englishmean' style='color:#FF0000;padding:5px;font-size:120%'>"+data.flashCardWordEnglishMeaning+"</h5>");
				$("#imageword").attr("src",data.flashCardWordImage);				
				$(".flashcardsound").html('');
				$(".flashcardsound").append("<source src='"+data.flashCardWordSound+"' type='audio/mpeg' preload='auto'>");
				document.getElementById("frontfacesound").load();
				document.getElementById("backcardsound").load();
				$("#backword").html('');
				$("#backword").append(data.flashCardWordVietMeaning);
			});
		});
	});