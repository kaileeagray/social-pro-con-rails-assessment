add_column :users, reset_digest:string,
add_column :users, reset_sent_at:datetime,
add_column :users, remember_digest:string,
add_column :users, password_digest:string

rails generate migration RemoveOldFromUsers reset_digest:string, reset_sent_at:datetime, remember_digest:string, password_digest:string
