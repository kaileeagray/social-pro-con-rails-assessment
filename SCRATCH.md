urls.map{|url| {"url"=>url, "dns_status"=>200, "title"=>url[7..-5]} }

<% @contributor_items_hash.each do |item|%>
  <tr>
      <td><%=item.description%> </td>
      <td>
        by <%=link_to item.user.name, user_path(item.user)%>
      </td>
  </tr>
<%end%>
