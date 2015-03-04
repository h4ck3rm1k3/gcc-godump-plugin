

class some_type {};

class field_type {
  some_type parent_class;
};

class identifier {
};

class field_decl {
  field_type type;  
  identifier name;
};

class field_list {
  void add(field_decl item);
};

class class_decl {
  field_list fields;
};

class param_type {
  some_type type;
};


class param_decl {
  param_type type;  
  identifier name;
};

class param_list {
  void add(param_decl &);
};

class method {
  param_list params;
};



class lang_output {
  void emit(class_decl &);
  void emit(field_decl &);
  void emit(field_type &);
  void emit(method     &);
  void emit(param_decl &);
  void emit(param_type &);
};


class golang_output {
  lang_output parent_class;
};
