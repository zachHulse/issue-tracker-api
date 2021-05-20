# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

admin_role = Role.create(name: :admin)
dev_role = Role.create(name: :dev)

admin = User.create(email: 'admin@example.com', password: '1234qwer')
dev = User.create(email: 'dev@example.com', password: '1234qwer')

Association.create(role: admin_role, user: admin)
Association.create(role: dev_role, user: dev)
