function varargout = final_project(varargin)
% FINAL_PROJECT MATLAB code for final_project.fig
%      FINAL_PROJECT, by itself, creates a new FINAL_PROJECT or raises the existing
%      singleton*.
%
%      H = FINAL_PROJECT returns the handle to a new FINAL_PROJECT or the handle to
%      the existing singleton*.
%
%      FINAL_PROJECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FINAL_PROJECT.M with the given input arguments.
%
%      FINAL_PROJECT('Property','Value',...) creates a new FINAL_PROJECT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before final_project_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to final_project_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help final_project

% Last Modified by GUIDE v2.5 06-May-2019 14:09:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @final_project_OpeningFcn, ...
                   'gui_OutputFcn',  @final_project_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before final_project is made visible.
function final_project_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to final_project (see VARARGIN)

% Choose default command line output for final_project
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes final_project wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = final_project_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in System_Start_Button.
function System_Start_Button_Callback(hObject, eventdata, handles)
handles = guihandles();
% hObject    handle to System_Start_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
symbol = handles.Ticker_Enter.String;
amount = str2double(handles.Edit_Short.String);
livetrad(symbol,amount);




% --- Executes on button press in System_Stop_Button.
function System_Stop_Button_Callback(hObject, eventdata, handles)
% hObject    handle to System_Stop_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Buy_Button.
function Buy_Button_Callback(hObject, eventdata, handles)
% hObject    handle to Buy_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
symbol = handles.Order_Ticker_Edit.String;
shares = str2double(handles.Order_Share_Edit.String);
IBMatlab('action','BUY', 'symbol',symbol,'quantity',shares,'type','MKT')
update_table(handles.port_table)


% --- Executes on button press in Sell_Button.
function Sell_Button_Callback(hObject, eventdata, handles)
% hObject    handle to Sell_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
symbol = handles.Order_Ticker_Edit.String;
shares = str2double(handles.Order_Share_Edit.String);
IBMatlab('action','SELL', 'symbol',symbol,'quantity',shares,'type','MKT')
update_table(handles.port_table)


function Order_Ticker_Edit_Callback(hObject, eventdata, handles)
% hObject    handle to Order_Ticker_Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Order_Ticker_Edit as text
%        str2double(get(hObject,'String')) returns contents of Order_Ticker_Edit as a double


% --- Executes during object creation, after setting all properties.
function Order_Ticker_Edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Order_Ticker_Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Order_Share_Edit_Callback(hObject, eventdata, handles)
% hObject    handle to Order_Share_Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Order_Share_Edit as text
%        str2double(get(hObject,'String')) returns contents of Order_Share_Edit as a double


% --- Executes during object creation, after setting all properties.
function Order_Share_Edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Order_Share_Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Ticker_Enter_Callback(hObject, eventdata, handles)
% hObject    handle to Ticker_Enter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ticker_Enter as text
%        str2double(get(hObject,'String')) returns contents of Ticker_Enter as a double


% --- Executes during object creation, after setting all properties.
function Ticker_Enter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ticker_Enter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Portfolio_Begin.
function Portfolio_Begin_Callback(hObject, eventdata, handles)
% hObject    handle to Portfolio_Begin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
update_table(handles.port_table)


% --- Executes on button press in Portfolio_Refresh.
function Portfolio_Refresh_Callback(hObject, eventdata, handles)
% hObject    handle to Portfolio_Refresh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
update_table(handles.port_table)


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1



function Edit_Short_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_Short (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_Short as text
%        str2double(get(hObject,'String')) returns contents of Edit_Short as a double


% --- Executes during object creation, after setting all properties.
function Edit_Short_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_Short (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Edit_Long_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_Long (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_Long as text
%        str2double(get(hObject,'String')) returns contents of Edit_Long as a double


% --- Executes during object creation, after setting all properties.
function Edit_Long_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_Long (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2


% --- Executes on button press in Back_Test.
function Back_Test_Callback(hObject, eventdata, handles)
% hObject    handle to Back_Test (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes2)
symbol = handles.Ticker_Enter.String;
amount = str2double(handles.Edit_Short.String);
bcktst(symbol,amount)

