class Gossip
    attr_reader :author, :content

    def initialize(author, content)
        @author = author
        @content = content
    end

    def save
        CSV.open("./db/gossip.csv", "ab") do |csv|
            csv << ["#{@author}", "#{@content}"]
        end
        puts '=> potin sauvegardé'
    end

    def self.all
        all_gossips = []
        CSV.read("./db/gossip.csv").each do |csv_line|
            all_gossips << Gossip.new(csv_line[0], csv_line[1])
        end
        return all_gossips
    end

    def self.find(id)
        CSV.read("./db/gossip.csv")[id.to_i]
    end
end
#-------------------------------------------------------------------    
=begin
    def update(author, content)
         csv = Chilkat::CkCsv.new()
        csv.put_HasColumnNames(true)
        success = csv.LoadFile("./db/gossip.csv")
        if (success != true)
            print csv.lastErrorText() + "\n";
            exit
            success = csv.SetCell(["gossip_author"], params["gossip_content"])
            csvDoc = csv.saveToString()
            print csvDoc + "\n";
            success = csv.SaveFile("out.csv")
            if (success != true)
                print csv.lastErrorText() + "\n";
            end
        end
    end

=end

