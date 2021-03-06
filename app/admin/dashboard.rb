ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do

    columns do
      column do
        panel "#{Election.active_election.name} At a Glance" do
          ul do
            li do
              strong "Candidacies: "
              span Election.active_election.candidacies.count
            end
            li do
              strong "Answered Questionnaires: "
              span Election.active_election.answered_questionnaires
            end
            li do
              strong "Approved News Articles: "
              span NewsArticle.approved.count
            end
            li do
              strong "Pending News Articles: "
              span NewsArticle.pending.count
            end
            li do
              strong "Rejected News Articles: "
              span NewsArticle.rejected.count
            end
          end
        end
      end
      column do
        panel "Extra Links" do
          ul do
            li link_to("Admin Users", admin_admin_users_path)
            li link_to("Comments", admin_comments_path)
          end
        end
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
