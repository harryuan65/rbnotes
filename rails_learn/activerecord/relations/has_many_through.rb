require_relative "../base"
require "faker"

class CreatePhysician < ActiveRecord::Migration[7.0]
  def change
    create_table :physicians, if_not_exists: true do |t|
      t.string :name

      t.timestamps
    end
  end
end

class CreatePatient < ActiveRecord::Migration[7.0]
  def change
    create_table :patients, if_not_exists: true do |t|
      t.string :name

      t.timestamps
    end
  end
end

class CreateAppointment < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments, if_not_exists: true do |t|
      t.references :physician
      t.references :patient
      t.timestamps
    end
  end
end

CreatePhysician.new.change
CreatePatient.new.change
CreateAppointment.new.change

class Physician < ActiveRecord::Base
  has_many :appointments
  has_many :patients, through: :appointments
end

class Appointment < ActiveRecord::Base
  belongs_to :physician
  belongs_to :patient
end

class Patient < ActiveRecord::Base
  has_many :appointments
  has_many :physicians, through: :appointments
end

physician1 = Physician.find_or_create_by!(name: "david")
patient1 = Patient.find_or_create_by!(name: "harry")
patient2 = Patient.find_or_create_by!(name: "janice")
appointment1 = Appointment.find_or_create_by!(physician: physician1, patient: patient1)
appointment2 = Appointment.find_or_create_by!(physician: physician1, patient: patient2)

=begin
physician1.patients
=> SELECT "patients".* FROM "patients" INNER JOIN "appointments" ON "patients"."id" = "appointments"."patient_id" WHERE "appointments"."physician_id" = 1
=end

if __FILE__ == $0
  binding.irb
end