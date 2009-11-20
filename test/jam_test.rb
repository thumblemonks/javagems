require 'test_helper'
require 'javagems/jam'

context "Jam: classpath_from_options" do
  context "with only -cp option" do
    setup do
      JavaGems::Jam.classpath_from_options(%w[-cp foo:bar])
    end

    should "include anything after -cp option" do
      topic.first
    end.equals("foo:bar")

    should "remove -cp option and value from option array" do
      topic.last
    end.equals([])
  end # with only -cp option

  context "with only -classpath option" do
    setup do
      JavaGems::Jam.classpath_from_options(%w[-classpath bar:food])
    end

    should "include anything after option" do
      topic.first
    end.equals("bar:food")

    should "remove option and value from option array" do
      topic.last
    end.equals([])
  end # with only -classpath option

  context "with -cp and -classpath options" do
    setup do
      JavaGems::Jam.classpath_from_options(%w[-cp foo:beard -classpath bar:food])
    end

    should "include anything after option" do
      topic.first
    end.equals("foo:beard:bar:food")

    should "remove options and values from option array" do
      topic.last
    end.equals([])
  end # with -cp and -classpath options

  context "with -cp, -classpath and some other options" do
    setup do
      JavaGems::Jam.classpath_from_options(%w[your -cp foo:beard classy -classpath bar:food mom])
    end

    should "include anything after option" do
      topic.first
    end.equals("foo:beard:bar:food")

    should "remove cp options and values but keep other stuff" do
      topic.last
    end.equals(%w[your classy mom])
  end # with -cp, -classpath and some other options

  context "when CLASSPATH defined but not the command line options" do
    setup do
      ENV["CLASSPATH"] = "bar:food"
      JavaGems::Jam.classpath_from_options(%w[your classy mom])
    end

    should "include just the CLASSPATH value" do
      topic.first
    end.equals("bar:food")

    should "leave command line options alone" do
      topic.last
    end.equals(%w[your classy mom])
  end

  context "when CLASSPATH , -cp, and -classpath are defined" do
    setup do
      ENV["CLASSPATH"] = "yum:juice"
      JavaGems::Jam.classpath_from_options(%w[your -classpath food classy -cp bar mom])
    end

    should "include just CLASSPATH, -cp, and -classpath values" do
      topic.first
    end.equals("yum:juice:bar:food")

    should "also keep the other command line options" do
      topic.last
    end.equals(%w[your classy mom])
  end
end # Jam: classpath_from_options
