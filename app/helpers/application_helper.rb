# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
 def contact_person_link(group)  
   if group.contact_person
     link_to group.contact_person.name, group.contact_person
   else
     'No one seems to have taken charge of this group. Add yourself as the contact person?'
   end
 end
  
end
