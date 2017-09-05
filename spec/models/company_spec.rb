require 'rails_helper'

describe Company do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        company = Company.new()
        expect(company).to be_invalid
      end

      it "has a unique name" do
        Company.create(name: "Dropbox")
        company = Company.new(name: "Dropbox")
        expect(company).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a name" do
        company = Company.new(name: "Dropbox")
        expect(company).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has many jobs" do
      company = Company.new(name: "Dropbox")
      expect(company).to respond_to(:jobs)
    end

    it { should have_many(:contacts) }
  end

  describe "class methods" do
    it " can find and increment average job interest" do
      company1, company2 = create_list(:company, 2)
      job1 = create(:job, level_of_interest: 7, company: company1)
      job2 = create(:job, level_of_interest: 5, company: company1)
      job1 = create(:job, level_of_interest: 6, company: company2)
      job2 = create(:job, level_of_interest: 4, company: company2)

      expect(company1.average_job_interest).to eq(6.00)
      expect(company2.average_job_interest).to eq(5.00)

      expect(Company.by_interest[0]).to eq(company1)
      expect(Company.by_interest[1]).to eq(company2)
    end
  end
end
