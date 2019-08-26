class CategoryEntity {
	String name;
	String enName;
	int rank;
	String sId;

	CategoryEntity({this.name, this.enName, this.rank, this.sId});

	CategoryEntity.fromJson(Map<String, dynamic> json) {
		name = json['name'];
		enName = json['en_name'];
		rank = json['rank'];
		sId = json['_id'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = this.name;
		data['en_name'] = this.enName;
		data['rank'] = this.rank;
		data['_id'] = this.sId;
		return data;
	}
}
