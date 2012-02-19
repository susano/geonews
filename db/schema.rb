# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 1) do
	create_table :locations do |t|
#		t.primary_key :id       , :null => false
		t.float       :latitude , :null => false
		t.float       :longitude, :null => false
		t.string      :original
	end

	create_table :events do |t|
#		t.primary_key :id            , :null => false
		t.datetime    :data_added    , :null => false
		t.datetime    :date_happening, :null => false
		t.string      :title         , :null => false
		t.text        :summary
		t.text        :description
		t.integer     :location_id   , :null => false
		t.integer     :event_type_id , :null => false
	end

	create_table :event_types do |t|
#		t.primary_key :id         , :null => false
		t.string      :description, :null => false
	end
end

