# frozen_string_literal: true

# Default user roles
Role.create name: :super_admin unless Role.find_by_name(:super_admin)
Role.create name: :admin unless Role.find_by_name(:admin)
Role.create name: :operator unless Role.find_by_name(:operator)

# Initial user
u = User.create(email: 'contato@rdmapps.com.br', password: 'lklklklk', name: 'Admin Rdmapps')
u.confirmed_at = Time.zone.now
u.save(validate: false)
u.add_role :super_admin

#Usuário admin
u_admin = User.create(email: 'admin1@admin.com', password: 'admin1', name: 'Admin1 User')
u_admin.confirmed_at = Time.zone.now
u_admin.save(validate: false)
u_admin.add_role :admin


#Outros usuários
u_operator = User.create(email: 'teste1@teste.com', password: 'teste1', name: 'Operator Teste1')
u_operator.confirmed_at = Time.zone.now
u_operator.save(validate: false)
u_operator.add_role :operator

u_operator2 = User.create(email: 'teste2@teste.com', password: 'teste2', name: 'Operator Teste2')
u_operator2.confirmed_at = Time.zone.now
u_operator2.save(validate: false)
u_operator2.add_role :operator
