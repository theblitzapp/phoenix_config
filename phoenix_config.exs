import PhoenixConfig, only: [crud_from_schema: 2, crud_from_schema: 1, remove_relations: 2]

alias PhoenixConfig.Support.Accounts

[
  crud_from_schema(Accounts.User,
    input_args: [
      create: [
        relation_inputs: [
          :role,
          labels: [required: [:label]],
          team: {[required: [:name]], [team_organization: [required: [:name]]]}
        ],
        required: [:name, :email],
        blacklist: [:email_updated_at]
      ],

      update: [
        relation_inputs: [
          :role,
          labels: [required: [:label]],
          team: :team_organization
        ],
        required: [:name, :email],
        blacklist_non_required?: true
      ],

      index: [
        blacklist: [:email_updated_at, :name]
      ],

      find: [
        required: [:id],
        blacklist_non_required?: true
      ]
    ]
  ),
  crud_from_schema(Accounts.TeamOrganization),

  remove_relations(Accounts.Role, [:users]),
  remove_relations(Accounts.Team, :users)
]