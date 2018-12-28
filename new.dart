class User{  
   
      String status;
      String totalResults;
      String articles; 
    
      User({ 
        this.status,this.totalResults,this.articles,
      });
      
      static User fromJson(Map<String,dynamic> json){
        return User( 
            status: json['status'],
            totalResults: json['totalResults'],
            articles: json['articles'],
        );
      }
      
      Map<String, dynamic> toJson() => { 
            'status': status ,
            'totalResults': totalResults,
            'articles': articles ,
      };
      
    }
    