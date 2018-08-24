class AnalysisController < ApplicationController

  @@questions = {

    1=> "부부의 자산 정도는 어느 정도 인가요?",

    2=> "결혼 년도는 몇 년 인가요?",

    3=> "별거경험이 있는 경우에 - 별거 기간은 어느 정도 인가요?",

    4=> "부부가 서로 이혼에 동의하시나요?",

    5=> "자녀가 있으신가요?"

  }

  @@answers = {

    1=> {

      1 => {"an" => 1, "text" => "3억 이내"},

      2 => {"an" => 2, "text" => "3~5억"},

      3 => {"an" => 3, "text" => "5~10억"},

      4 => {"an" => 4, "text" => "10억 이상"}

    },

    # 2=> {

    #   "year" => 12

    # },

    # 3=> {

    #   "year" => 12, "month" => 3 

    # },



    4=> {

      1=> {'an' =>1, "text" => "O"},

      2=> {'an' =>2, "text" => "X"}

    },

    5=> {

      1=> {'an' =>1, "text" => "O"},

      2=> {'an' =>2, "text" => "X"}

    }

}



  def q1

    @Q1 = @@questions[1]

    @A1 = @@answers[1]

  end



  def q2

    @Q2 = @@questions[2]

  end



  def q3

    @Q3 = @@questions[3]

    @A3 = @@answers[3]

  end



  def q4

    @Q4 = @@questions[4]

    @A4 = @@answers[4]

  end



  def q5

    @Q5 = @@questions[5]

    @A5 = @@answers[5]

  end



  def result_page

    

    #input_data

    input_data = {                 

       "total_asset" => params[:total_asset_an].to_i, 

       "marriage_year" => params[:marriage_year].to_i,

       "separation_period" => {

          "year" => params[:separation_period_year].to_i,

          "month" => params[:separation_period_month].to_i

       },

       "agreement" =>params[:agreement].to_i,

       "parental_status" => params[:parental_status].to_i

     }

     puts "KKKKKK#{input_data["separation_period"]}"

     puts "KKKKKK#{input_data["separation_period"]}"

     puts "KKKKKK#{input_data["separation_period"]}"

     

     





     @total_asset = @@answers[1][input_data["total_asset"]]["text"]

     @marriage_year = params[:marriage_year]

     @separation_period_year = params[:separation_period_year]

     @separation_period_month = params[:separation_period_month]

     @agreement = @@answers[4][input_data["agreement"]]["text"]

     @parantal_status = @@answers[5][input_data["parental_status"]]["text"]

     @idd = 1


     # input_data = {                 

     #   "total_asset" => 1, 

     #   "marriage_year" => 10,

     #   "separation_period" => {

     #      "year" => 2,

     #      "month" => 3

     #   },

     #   "agreement" =>1,

     #   "parental_status" => 2

     # }





    models = Case.all



    asset_selected_ids=[]

    marriage_year_selected_ids=[]

    separation_selected_ids=[]

    agreement_selected_ids=[]

    parental_status_selected_ids=[]

    array_list = [asset_selected_ids, marriage_year_selected_ids, separation_selected_ids, agreement_selected_ids, parental_status_selected_ids]



    #재산 규모 분류

    #재산 규모 분류

    for i in 1..(models.last.id) # id number를 통해 처음부터 끝까지 db에 저장된 데이터 베이스 전체를 조사한다.

        db_unit_hash = models.find(i).attributes #db_unit_hash는 id == i 인 row의 데이터를 해쉬로 받는다

        if (input_data["total_asset"] == db_unit_hash["total_asset"])

           asset_selected_ids.push(db_unit_hash["id"])

         # input의 재산규모 값과 db에 저장된 재산 규모 값이 같으면 asset_selected_ids array에 id를 추가한다.

        end

    end



    #결혼기간 분류

    for i in 1..(models.last.id)

        db_unit_hash = models.find(i).attributes

        if(input_data["marriage_year"] <= db_unit_hash["marriage_year"] + 3 && input_data["marriage_year"] >= db_unit_hash["marriage_year"]-3)

           marriage_year_selected_ids.push(db_unit_hash["id"])

        # input의 결혼기간 값과 +- 3년 인 데이터만 marriage_year_selected_ids array에 id를 추가한다.

        end

    end



    #별거기간 분류

    for i in 1..(models.last.id)

        db_unit_hash = models.find(i).attributes

        puts "db_unit_hash: #{db_unit_hash}"

        puts "db_unit_hash: #{db_unit_hash}"

        puts "db_unit_hash: #{db_unit_hash}"

        puts "db_unit_hash: #{db_unit_hash}"

        puts "db_unit_hash: #{db_unit_hash}"

        puts "db_unit_hash: #{db_unit_hash}"

        puts "db_unit_hash: #{db_unit_hash}"



        real_separation = input_data["separation_period_year"].to_f + (input_data["separation_period_month"].to_f/12) #별거기간 소수점까지 계산

        db_real_separation = db_unit_hash["separation_period_year"] + db_unit_hash["separation_period_month"]/12 #db의 별거기간도 소수점까지 계산

        if(real_separation<=db_real_separation+1 && real_separation>=db_real_separation-1)

            separation_selected_ids.push(db_unit_hash["id"])

        end

    end



    #동의여부

    for i in 1..(models.last.id)

        db_unit_hash = models.find(i).attributes

        if(input_data["agreement"] == db_unit_hash["agreement"])

           agreement_selected_ids.push(db_unit_hash["id"])

        # input의 동의여부와 db의 동의여부가 같을 시에 agreement_selected_ids에 추가

        end

    end



    #자녀여부

    for i in 1..(models.last.id)

        db_unit_hash = models.find(i).attributes

        if(input_data["parental_status"] == db_unit_hash["parental_status"])

           parental_status_selected_ids.push(db_unit_hash["id"])

        # input의 자녀여부와 db의 자녀여부가 같을 시에 parental_status_selected_ids에 추가

        end

    end



    #교집합이 많은 아이디 추출

    #해시사용

    matchscore_of_id = Hash.new  #id 가 key로 들어가는 해시

      models.all.each do |x|

        matchscore_of_id[x.id] = 0

      end



    # asset_selected_ids=[1 2 3 4 8]

    # marriage_year_selected_ids=[4 5 8]

    # separation_selected_ids=[2 4 8]

    # agreement_selected_ids=[1 2 4 5]

    # parental_status_selected_ids=[1 2 3 4 5]





    # id   #matchscore_of_id 

    # 1 => 3

    # 2 => 4

    # 3 => 2

    # 4 => 4

    # 5 => 3

    # 6 => 0

    # 7 => 0

    # 8 => 2



    #matchscore_of_id에 counting





    for i in 1..matchscore_of_id.length

     for l in 0..(array_list.length-1)

        j = array_list[l]

        if (!j.empty?)

          puts "JJJJJJ#{j}"

          for k in 0..(j.length-1)

             if i == j[k]

                matchscore_of_id[i]+=1

             end

          end

        else



        end

      end

    end

      #복잡했던 for 문을 하나로 묶음

    # for i in 1..matchscore_of_id.length

    #    for j in (array_list.last-1)

    #     puts "JJJJJJJ#{j}"

    #       for k in 1..array_list[j].last

    #          if i == j[k]

    #             matchscore_of_id[i]+=1

    #          end

    #       end

    #    end

    # end



    #value 크기대로 sorting

    ids_of_search_results = matchscore_of_id.to_a.sort_by{|_key, value| value}.reverse!.to_h



    #검색결과!

    search_results = []

    puts "ZZZZZZZZ#{ids_of_search_results}"

    puts "ZZZZZZZZ#{ids_of_search_results}"

    ids_of_search_results.each do |x|

       models.all.each do |y|

          if ( (x[0] == y.id) && (x[1] != 0) )

             search_results.push(models.find(y.id))

          end

       end

    end

    @search_results = search_results

  end

end