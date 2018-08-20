
//= require jquery3

//= require popper

//= require bootstrap







function Tab(num){

        for(i=1;i<5;i++){

            if (i!=num){

                $("#div"+i).hide()

            }

        }

        $("#div"+num).fadeIn("slow")



        clicked_obj=document.getElementById("tab_"+num);

        string_active = "flex-sm-fill text-sm-center font-weight-bold active";

        string_inactive = "flex-sm-fill text-sm-center font-weight-bold bg-light";



        text_box_text1 = "이혼절차 정보를 알기쉽게, 이해하기 쉽게 제공합니다.";

        text_box_text2 = "차별화된 알고리즘으로 고객의 상황에 맞는 판례를 검색합니다.";

        text_box_text3 = "국내 최고의 이혼 전문 변호사들과 함께 이혼 소송을 준비할 수 있습니다.";

        text_box_text4 = "이혼에 관심있는 다른 사람들과 정보를 공유해보세요.";



        text_box_button1 = "이혼 절차 정보";

        text_box_button2 = "판례 검색 시작";

        text_box_button3 = "컨설팅 시작";

        text_box_button4 = "커뮤니티";



        for (i=1; i<5; i++){

        	temp_obj = document.getElementById("tab_"+i);

        	if (temp_obj == clicked_obj){

        		temp_obj.className = string_active;

        		temp_obj.className += i;

        		temp_obj.className += " tab"+i;

        	}else{

        		temp_obj.className = string_inactive+" tab"+i;

        	}

        }

    }





// This is a manifest file that'll be compiled into application.js, which will include all the files

// listed below.

//

// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's

// vendor/assets/javascripts directory can be referenced here using a relative path.

//

// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the

// compiled file. JavaScript code in this file should be added after the last require_* statement.

//

// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details

// about supported directives.

//