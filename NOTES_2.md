<%= render :partial => 'items/form', :f => builder, locals: {item: @pro, hide: true, pro_con: true} %>
<%= render :partial => 'items/form', :f => builder, locals: {item: @con, hide: true, pro_con: false} %>


<% @questions.each do |question| -%>
     <tr>
       <td><%= question.content %></td>
       <td>
       <%= f.fields_for :questions, question do |q| -%>
         <%= q.fields_for :answers, question.answers.find_or_initialize_by(participant: participant) do |a| -%>
           <%= a.text_area :content %>
           <%= a.hidden_field :participant_id, participant.id %>
         <% end -%>
       <% end -%>
